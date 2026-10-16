# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.39.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.39.0/talon-darwin-arm64"
      sha256 "b8f90cd7ee1c1e38100e1b900820cac590802246a17ee0185a3fe4f9052ea082"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.39.0/talon-darwin-x64"
      sha256 "10cf426809a5f669f82810ca119aa890677ee39efb55575fefbb7d2ef8c10d99"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.39.0/talon-linux-arm64"
      sha256 "b2eca3233977d0e388169d24b044044c5767743fc527cb12de1bf0c6d984a73b"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.39.0/talon-linux-x64"
      sha256 "be8c0c4f225c1314c20b1accfe98975d1d7a3cb9848acbd740a5f67150862a20"
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
