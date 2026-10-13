# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.38.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.38.1/talon-darwin-arm64"
      sha256 "aa27ae0eca683370dbfab4c141de83bd7ba9d86192d10e414566c4c0b457bab1"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.38.1/talon-darwin-x64"
      sha256 "7be59c4ad633ee9bda88a81ce3d4e700bb708640cccd9b872bc7f052f4ba288f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.38.1/talon-linux-arm64"
      sha256 "cc151708c0d9d93473e4a76dd597bfa0e849de356c02cf51ad286afea44ad51b"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.38.1/talon-linux-x64"
      sha256 "cfb3dcc61a89eacaa60819691e090360f6f10c3812b9b551becfed4f1d5f5f10"
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
