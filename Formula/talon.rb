# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.24.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.24.0/talon-darwin-arm64"
      sha256 "2cbebeb5e50c25c16e0c18fb3f13963e835bea9380073537b21254cd1a6e12bd"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.24.0/talon-darwin-x64"
      sha256 "0b3b5541259dcd92cec4677eb68b289c0b1837935a7aaaac397c91ce477ef7eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.24.0/talon-linux-arm64"
      sha256 "04d2444537d546c716d4f9959630e6ccea047d71eeb0ef1d1b5d2d79e1a50031"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.24.0/talon-linux-x64"
      sha256 "7d041c74e815623b8f6afc820301e23b79d4d08d524bd0b0c82d1fe4a6473807"
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
