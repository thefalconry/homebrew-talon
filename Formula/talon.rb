# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.27.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.27.0/talon-darwin-arm64"
      sha256 "67cccbb6aba3992c64c3f3156c320de2973a7feaa234c32cf3db38db204087ad"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.27.0/talon-darwin-x64"
      sha256 "cf2af98bfcc6b9604f9df6cbfeefcb8bcf821a5f94f510428cafb6adc8bf5344"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.27.0/talon-linux-arm64"
      sha256 "6b51c2e3d2cf09625fed30ca49804a217e791aec66385b5d6d8a85e4051ea71c"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.27.0/talon-linux-x64"
      sha256 "018b16ea82e558e77ddba3dbdf4e70793cd87ad81c2c582c55d6246368ede5f3"
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
