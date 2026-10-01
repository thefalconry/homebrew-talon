# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.29.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.29.0/talon-darwin-arm64"
      sha256 "a30376c35f8ab16d3f3a8c3282b167f9c9c69010a5c38c5118d9828c3caa8aed"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.29.0/talon-darwin-x64"
      sha256 "f9573ce207c6035b41534718bef9fa519fce77fafc6caf4edcd9239dde976cf9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.29.0/talon-linux-arm64"
      sha256 "19fd4910d49a2825ffe9b9b89c3bdf061ccd11b646ba74e9d73971cdd8a495c4"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.29.0/talon-linux-x64"
      sha256 "21803a57b2f1c856844d010e50321726dbe461a4c5865353e89490bfdffa4716"
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
