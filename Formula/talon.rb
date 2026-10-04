# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.33.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.33.1/talon-darwin-arm64"
      sha256 "bca3f369cbb5c663250a6b87d20b0b03c86e650f5f0318a8817f411b34cf6ce0"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.33.1/talon-darwin-x64"
      sha256 "9f99df06d953de7974f6a6d47360dc8f1ff586bdf13e955a966b57f940cd9368"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.33.1/talon-linux-arm64"
      sha256 "ad41c561a0139b971c5a7481f8191c648226dfeb1fc38a9bb5feca22cad498e3"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.33.1/talon-linux-x64"
      sha256 "c01da4bc0ff0e04588dc267a3fa925c902dde5fb95e2c61426ff54461a68b628"
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
