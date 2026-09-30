# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.25.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.25.1/talon-darwin-arm64"
      sha256 "bd4d538fb8efc5f6b97fc19f0708e1e6376027b9131f32c3e969b21eac487c88"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.25.1/talon-darwin-x64"
      sha256 "1b1ff9c0bb1e41c60fda0944d7ff730f7f2fa93335a54633d0c3120d44a16a71"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.25.1/talon-linux-arm64"
      sha256 "dc6d8fbcc6736a732d09a6966dda1e20e88a2a649b76476d4fee9f922010c223"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.25.1/talon-linux-x64"
      sha256 "5a97360cec411d7a816b6c0ce3bcf2c27ddd79fa16c4c03a5d55bf84c18af25b"
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
