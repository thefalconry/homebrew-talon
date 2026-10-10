# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.36.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.36.3/talon-darwin-arm64"
      sha256 "b96171ec6e76f2dac3e1a114aec1bea97e23c8e9cb98219a617fd0c5c639ee57"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.36.3/talon-darwin-x64"
      sha256 "9d74961719fe192ee7ecfef517fdca00ded4e89e37bfee81d5a24d3c97eea493"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.36.3/talon-linux-arm64"
      sha256 "9fa63cc5c41cfcb47c403730df2b252560929274938e1c20e6c6be25c8c65434"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.36.3/talon-linux-x64"
      sha256 "09623054f0f601a11d67a913afb7b7def590d94fc3c97e90f8fffdc0405a8ff9"
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
