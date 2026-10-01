# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.32.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.32.0/talon-darwin-arm64"
      sha256 "34cb1e45e3272ddbc4105fd684636c4a149ffa8f589c97ab18666dda5df6f2cb"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.32.0/talon-darwin-x64"
      sha256 "7d0130068bb44502a91d282baaa131ed60243b02c5af0fa7aec0009dc419e123"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.32.0/talon-linux-arm64"
      sha256 "653d8d3ee874ca748ae40331ad09eae64eb19a569f70b1e813efde0cc2ecb99d"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.32.0/talon-linux-x64"
      sha256 "ba7669d3297d4337e4ccaf19646acd4328ccc5477c2f07d218df6b33392f9ab3"
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
