cask "qingluan" do
  version "0.2.1"
  sha256 "38bd8a89b08e60e307cc91c648351302964a1475f2654945d8774fb847567d4f"

  url "https://github.com/csthink/mars-assistant-mac/releases/download/v#{version}/Qingluan-#{version}-arm64.dmg"
  name "青鸾"
  name "Qingluan"
  desc "Desktop assistant and workbench"
  homepage "https://github.com/csthink/mars-assistant-mac"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Qingluan.app"

  zap trash: [
    "~/Library/Application Support/csthink-assistant",
    "~/Library/Application Support/csthink-assistant-executions",
    "~/Library/Application Support/csthink-assistant-runtimes",
    "~/Library/Application Support/csthink-assistant-shell",
    "~/Library/Application Support/csthink-assistant-vault",
    "~/Library/Preferences/com.csthink.assistant.plist",
    "~/Library/Saved Application State/com.csthink.assistant.savedState",
  ]

  caveats <<~EOS
    青鸾 (Qingluan) is ad-hoc signed and not notarized by Apple.
    If macOS blocks the first launch: System Settings → Privacy & Security → Open Anyway.
    The disk image also carries a shortcut that opens that page. Do not turn off Gatekeeper.

    Requires macOS 26.6.2 or later. After an upgrade, macOS may ask again before
    青鸾 reads the API keys it saved in your keychain; if you deny it, enter the
    keys again in Settings.

    The saved API keys are in the login keychain item "csthink-assistant Safe Storage";
    `brew uninstall --zap` does not remove keychain items.
  EOS
end
