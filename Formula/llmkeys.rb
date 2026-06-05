class Llmkeys < Formula
  desc "Credential and config manager for LLM providers (keychain/Bitwarden-backed)"
  homepage "https://github.com/csthink/llmkeys"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/csthink/llmkeys/releases/download/v0.1.2/llmkeys-0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "0050f0122ad0fd099a1ca4132e9f5c48a3f19cfd00e5b20bd8452a4b9146de9a"
    end
    on_intel do
      url "https://github.com/csthink/llmkeys/releases/download/v0.1.2/llmkeys-0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "9fa7ea9d466b071dc0eec2d106c01a706caf36dafe057ceb1fd44387d8d93dba"
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
