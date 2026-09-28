# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.20.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.20.1/talon-darwin-arm64"
      sha256 "983f3e8b2194c6f808f1153b43a1c56c476c10dfca8e4d2c123503954935c208"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.20.1/talon-darwin-x64"
      sha256 "a414ec043f7b4995100d07feedf88225774bad27d99711a19c272f6252eca831"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.20.1/talon-linux-arm64"
      sha256 "c0f6a6b0a086e2527a91328f4ed56bd49bfcc5780614ab73a8c86a07d9e257e4"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.20.1/talon-linux-x64"
      sha256 "7bb6bfee0d7989de6f4d99bd0a255377563521540d5c42822150631e0a18892a"
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
