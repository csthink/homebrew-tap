class Llmkeys < Formula
  desc "Credential and config manager for LLM providers (keychain/Bitwarden-backed)"
  homepage "https://github.com/csthink/llmkeys"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/csthink/llmkeys/releases/download/v0.1.1/llmkeys-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "b7754135431235eb3a925f6213e636c42cb30a4c12022f5df8aff46c2ab8156d"
    end
    on_intel do
      url "https://github.com/csthink/llmkeys/releases/download/v0.1.1/llmkeys-0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "0f386ec046fde657e075cc30af2aa5e69c0d80ceeb8490702d213b8d0f87e5db"
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
