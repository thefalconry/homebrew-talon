# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.35.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.35.0/talon-darwin-arm64"
      sha256 "41b6a3cb4e8499aca8e13e1a3fbc6f4d198678502e21b51f7759e748c3909aa1"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.35.0/talon-darwin-x64"
      sha256 "ee1faa447ba2470b33e477547ab4d7322725f062a4fc8026f261f8326d3e2ede"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.35.0/talon-linux-arm64"
      sha256 "b51f397299e1df2ec18dbe08b20c7ac265af4a3d55880f31a3423670197602fa"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.35.0/talon-linux-x64"
      sha256 "3b3d49abdae0c0b3793689506c22065b3a40eb49e51a8e6689b259a55af47e11"
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
