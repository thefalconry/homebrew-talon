# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.37.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.37.2/talon-darwin-arm64"
      sha256 "68b8204e193c7e682ef297b80220599da45a7080fe49353492001c61ae2446c9"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.37.2/talon-darwin-x64"
      sha256 "9f9bf93abab473cef73597b55f94c1ddbde3f05bc755bc1eb954a2d89d63f9c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.37.2/talon-linux-arm64"
      sha256 "183fe30937f5eeefc0463ab5aa744b1062b733de18d8f257bc9901a701e9e7f5"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.37.2/talon-linux-x64"
      sha256 "bd9167fe0853a0ab30ce74c080f0f9fb07ff797d79b261949aa640b285bfa588"
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
