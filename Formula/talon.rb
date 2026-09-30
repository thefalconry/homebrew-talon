# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.24.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.24.1/talon-darwin-arm64"
      sha256 "22590c39d1319663226a3ad3ada6687ae1815abbb6bcf4af0f2c4d5fc1c47491"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.24.1/talon-darwin-x64"
      sha256 "df9fb017101c0dacb44981c1e49ca5f4fd9fcff510563175656a95d1467cf563"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.24.1/talon-linux-arm64"
      sha256 "9a4391a2603f6e1ab0248415a1138033875da47f420f32bdca13246c1e2696ba"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.24.1/talon-linux-x64"
      sha256 "5e570b2c13f8f556ae6da41a80e113a8535a377b235ae35a0c384361c807db8f"
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
