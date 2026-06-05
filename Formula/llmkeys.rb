class Llmkeys < Formula
  desc "Credential and config manager for LLM providers (keychain/Bitwarden-backed)"
  homepage "https://github.com/csthink/llmkeys"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/csthink/llmkeys/releases/download/v0.1.2/llmkeys-0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "be539d0804e76cc80197c4d6654f2d36c52bc181a0478e4a78da9ffe46b57649"
    end
    on_intel do
      url "https://github.com/csthink/llmkeys/releases/download/v0.1.2/llmkeys-0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "ce023f00247e54bfe96c2b35ec57848900c34ab3fc50549dcb62914ac6672a53"
    end
  end

  def install
    bin.install "llmkeys"
  end

  def caveats
    <<~EOS
      🍵  llmkeys is ready — enjoy!

      Quick start:
        llmkeys list                  # browse available providers
        llmkeys key set <provider>    # stash an API key in your macOS keychain
        llmkeys env <provider>        # print a paste-ready .env snippet

      Docs & issues: #{homepage}
    EOS
  end

  test do
    assert_match "llmkeys #{version}", shell_output("#{bin}/llmkeys --version")
  end
end
