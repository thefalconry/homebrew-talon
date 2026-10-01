# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.31.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.31.1/talon-darwin-arm64"
      sha256 "0bdb6f21bdd442c98259634c7bbeaee54183e77bb6306c63443ca3a869fa888a"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.31.1/talon-darwin-x64"
      sha256 "1cab65d09882a664d9a5f876bb8e4eb3624d8864265e70ef4e42ccb0f7ad4e01"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.31.1/talon-linux-arm64"
      sha256 "12b542e25182248c46c54bea1a26bf238c5c692b382d562cd5f4790b3dad5e0d"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.31.1/talon-linux-x64"
      sha256 "c7e740837a8f93d9a1d388f3e0a8845323d6fa2fdb0deb5c463ac2c0b25899b8"
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
