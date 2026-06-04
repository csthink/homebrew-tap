class Llmkeys < Formula
  desc "Credential and config manager for LLM providers (keychain/Bitwarden-backed)"
  homepage "https://github.com/csthink/llmkeys"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/csthink/llmkeys/releases/download/v0.1.2/llmkeys-0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "26fa737dac854809530d3d16be74e891b3aa02d19112a39071b98b795f463b71"
    end
    on_intel do
      url "https://github.com/csthink/llmkeys/releases/download/v0.1.2/llmkeys-0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "ea01f9c1993d722b550660e92b662d73148972509a4ae2e1c6f1ed3841c4d5d4"
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
