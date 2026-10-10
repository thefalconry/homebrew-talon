# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.36.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.36.0/talon-darwin-arm64"
      sha256 "2403d1aa8f013c527c3406d4f60d69428ce9c68b0c28f5f31e1977738cb89680"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.36.0/talon-darwin-x64"
      sha256 "79e88c5457ee18fb4941ade9e32ca1b360ad121ec23a2ca60dbcd4547d9d2cb0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.36.0/talon-linux-arm64"
      sha256 "fae966f070dde0faa0aa1ea3ad95f172000f04647421719bed899b30255ef2b2"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.36.0/talon-linux-x64"
      sha256 "0fad2ed9484af8fbb91924fa7cf126f742d67a65f439e9dcdab2d03c2a892af3"
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
