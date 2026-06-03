class Llmkeys < Formula
  desc "Credential and config manager for LLM providers (keychain/Bitwarden-backed)"
  homepage "https://github.com/csthink/llmkeys"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/csthink/llmkeys/releases/download/v0.1.0/llmkeys-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "db9ddd6da105b7fb4ae5020ced10f09f9f547ce99db49a57aa5bb741a83a9e49"
    end
    on_intel do
      url "https://github.com/csthink/llmkeys/releases/download/v0.1.0/llmkeys-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "5dbc62f77a648bce62a9ec3035fa0261472ef6a964ae39ca597cbd9bf7b70724"
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
