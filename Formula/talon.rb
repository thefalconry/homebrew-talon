# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.39.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.39.2/talon-darwin-arm64"
      sha256 "79d105dc7bb069ce327ecfd99a1b36fd3fe279a39616850fb9e888c9d0732598"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.39.2/talon-darwin-x64"
      sha256 "4e4966f77fd277a37943ab0144fd30fe9986c38835e7accd362c1640478f5254"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.39.2/talon-linux-arm64"
      sha256 "632b2a592a6f529821557a747d6a7f1d51d2deaf96e30dbb2c9146a7bbf41e53"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.39.2/talon-linux-x64"
      sha256 "c0b8f14555d43d840b2e591d9baaa3b260e7721cde7d615c19f486dd1382cac1"
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
