# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.35.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.35.1/talon-darwin-arm64"
      sha256 "8138a2a6ad8a386b72bf8d64a2d359283d545c674e1713027b2dfc8cc8fde60f"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.35.1/talon-darwin-x64"
      sha256 "62ab0f8642905274fcfd3ae9e4ec1622ed262a0c1be346b4dce68431878be9d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.35.1/talon-linux-arm64"
      sha256 "9e9794981763c7dc3b74ef49b31ebaeb660ba94be8e3b61935d2cab7bbc3d48b"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.35.1/talon-linux-x64"
      sha256 "d3a26779cf519b9cca751eea29a9b4e90b53adf41ac12c0bfb866d1e3be8dc06"
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
