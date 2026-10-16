# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.38.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.38.3/talon-darwin-arm64"
      sha256 "593fbdbea23bbcf89de68bb7f30e1f19f9fb82b4a45f1b4ba86f65a8909253bd"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.38.3/talon-darwin-x64"
      sha256 "f6e10abbeeb3b6332be885af5362971f30dd9969b93601063b8413d6abde5517"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.38.3/talon-linux-arm64"
      sha256 "4f50b0d3c4f6f204dbf3e78d9100806ef32342015958c60e01a6cf0c9900370d"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.38.3/talon-linux-x64"
      sha256 "eb92940d7755b9bf35d0b02fdeec1c1182071fcd881a3a38f59ab3da430258cc"
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
