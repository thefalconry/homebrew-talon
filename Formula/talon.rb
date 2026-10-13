# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.38.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.38.0/talon-darwin-arm64"
      sha256 "85d6c718ba6e739ce2883900ac59f5a316e3e04ced1f2c03ddd4c195a03a3fda"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.38.0/talon-darwin-x64"
      sha256 "7c6ef3213901d0bcf29517cd550414104ab28888cbf8a7ac34821d352b00bfe5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.38.0/talon-linux-arm64"
      sha256 "e01cdd32f46fd518f708a1a06609625fe6f595e28350587a406d7a09114071ad"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.38.0/talon-linux-x64"
      sha256 "6944b42e33a2949c46db6e34f9ab5ffb742550a775262d785634472d44fca27f"
    end
  end

  def install
    # Homebrew downloads the bare binary asset under its remote
    # basename (talon-<os>-<arch>); install it as .
    bin.install Dir["talon-*"].first => "talon"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/talon --version")
  end
end
