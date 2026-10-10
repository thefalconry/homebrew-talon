# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.36.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.36.1/talon-darwin-arm64"
      sha256 "02ee8bd270e4c7b06d9e700b1982634d2f6d326ab0815d3268e923d0ec330acf"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.36.1/talon-darwin-x64"
      sha256 "939d6790a2359537138e227490bb400bde24716235645662052803b8c964f884"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.36.1/talon-linux-arm64"
      sha256 "69661ffa62a2be92618cba1c703295ad9547646128896cdc7432d3422f53d04d"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.36.1/talon-linux-x64"
      sha256 "429883202b16dee053e13d0c1b41804998a4ca9bfc5b385052f7bd8b3f231686"
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
