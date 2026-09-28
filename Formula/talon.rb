# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.20.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.20.0/talon-darwin-arm64"
      sha256 "f3605b6b1b08d1ea072aa4176af66b958cc3a519b5b1d68f674391e5cc599806"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.20.0/talon-darwin-x64"
      sha256 "a44992129babe9677ff9a3fb7ece07ee0a6d9ae80fd95c9a6c5fe27147dc4a44"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.20.0/talon-linux-arm64"
      sha256 "60ea6d2b7551647a1f63d9237d3fec90d9a6e425e6d1d64e63d3ff61e6313c35"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.20.0/talon-linux-x64"
      sha256 "d23fceba94e5dd6bf0a53dec4ff680d0150e1b739b4cb7775b48ab44b43d25a3"
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
