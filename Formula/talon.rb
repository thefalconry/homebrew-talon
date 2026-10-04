# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.32.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.32.1/talon-darwin-arm64"
      sha256 "bf10a87d4e920f6ca6c149ab40b61054705007e0361931c8436694b6d2cf4c5c"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.32.1/talon-darwin-x64"
      sha256 "5dd47f50058c2137fe6d360ec522e6f157bde3ac769e95918d11f853b4886cc0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.32.1/talon-linux-arm64"
      sha256 "00d1e63960d98de956a2edcba3a9594692379aac0b35fc140da784c3b19ea271"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.32.1/talon-linux-x64"
      sha256 "d862e311a7bdbb58366dec4dddc2a23fb1f8eebb6437feaf62b5311602b6ca64"
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
