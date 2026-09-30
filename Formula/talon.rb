# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.26.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.26.5/talon-darwin-arm64"
      sha256 "18080bbdbf755b029276891be352acf4cc23852fe169fe7b6f7a2a291e479e3d"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.26.5/talon-darwin-x64"
      sha256 "0bda16385316d07a013acef47398d7b0ef8f93502f249434b9df1659fe9387e7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.26.5/talon-linux-arm64"
      sha256 "1f0740313c99fd97b6ae086e75c83c193a4bf4063c46fff2024af78a4cff7c6d"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.26.5/talon-linux-x64"
      sha256 "a7b0ae4f69cce2e7e7a78a0279f1c76727b39e73adf631eabbfb99958e6208b9"
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
