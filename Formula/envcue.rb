# typed: false
# frozen_string_literal: true

# Source-build formula: the user's machine compiles with Xcode 26. package-app.sh builds the
# release binary and wraps it as the menu-bar .app; the bundle is installed into the prefix and
# its inner binary is symlinked onto PATH, so one install gives both the `envcue` CLI and the GUI.
# (Rendered from packaging/envcue.rb.tmpl by the envcue release workflow and pushed here.)
class Envcue < Formula
  desc "Per-terminal environment layer switcher for macOS + zsh"
  homepage "https://github.com/csthink/envcue"
  url "https://github.com/csthink/envcue/archive/refs/tags/v0.1.0.tar.gz"
  version "0.1.0"
  sha256 "2bdfa6a81e1859672bcb9ba26b058f076f609e1ec481728c931393be06cd0249"
  license "MIT"

  depends_on xcode: ["26.0", :build] # Tahoe SDK: the Liquid Glass SwiftUI APIs
  depends_on macos: :tahoe           # macOS 26+

  def install
    ENV["ENVCUE_SWIFT_BUILD_FLAGS"] = "--disable-sandbox" # let SwiftPM fetch deps in brew's sandbox
    system "bash", "scripts/package-app.sh", version.to_s
    prefix.install buildpath/".build/EnvCue.app"
    # The same binary is CLI (argv) and GUI (no argv); expose the CLI on PATH.
    bin.install_symlink prefix/"EnvCue.app/Contents/MacOS/envcue" => "envcue"
  end

  def caveats
    <<~EOS
      The EnvCue menu-bar app is installed at:
        #{opt_prefix}/EnvCue.app
      Launch it:
        open #{opt_prefix}/EnvCue.app
      (add it to Login Items to start at login). The `envcue` CLI is already on your PATH.

      Enable the per-terminal shim once, then open a new terminal:
        envcue install
    EOS
  end

  test do
    assert_match "Per-terminal environment", shell_output("#{bin}/envcue --help")
  end
end
