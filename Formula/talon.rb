# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.31.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.31.0/talon-darwin-arm64"
      sha256 "93fffec32a97261844669fd5dc0ea5d5d28ce797ffe93d6f29b3bd8b8bf2939d"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.31.0/talon-darwin-x64"
      sha256 "15b510d33b733c3f9ae11fc77a981a11dfe76cdfe2a33ccae3c8e367d23e1496"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.31.0/talon-linux-arm64"
      sha256 "1162db672d769ce6eb0d7b4d6a24bee9e5fea771e463d71ede186076f7b088c2"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.31.0/talon-linux-x64"
      sha256 "35781461df590a3eb883822c6537d7b814a740d39afc279fa919e0b1b1154dba"
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
