# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.33.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.33.2/talon-darwin-arm64"
      sha256 "397f414e46d1468af42446d3734a35ad554d62bd96b596f40d8c0d5d445ed99b"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.33.2/talon-darwin-x64"
      sha256 "232ea09d03b1fa75c2b97bb6930bffdc414407119e87b808d8ca0488f80080c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.33.2/talon-linux-arm64"
      sha256 "f1cce5850c98b626a47062bf96748fabf4e17a889d7fa40a974002b61eae5d8f"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.33.2/talon-linux-x64"
      sha256 "82e26399628bc1da7a9f2fa288aae1b7a7aeb6257576a635e4f6e4dec3e7c8da"
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
