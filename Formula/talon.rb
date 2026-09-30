# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.25.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.25.0/talon-darwin-arm64"
      sha256 "dc137777390841c62e64042f2fd1908bb9421e18c6533cfe9cbb4eb9d2bd3c20"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.25.0/talon-darwin-x64"
      sha256 "565c6e52e3f5af739451dc31d137fc81c2fe8a079485b9f896735634fd65e8f5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.25.0/talon-linux-arm64"
      sha256 "3dc8b30e2b0aa4801749128d062a2f96f6a9cdbbc32516cec215305ea7816a6f"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.25.0/talon-linux-x64"
      sha256 "42f103fa260f844a5b563bc83c808a6425f106c52b3f52a4660592ce142ab76f"
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
