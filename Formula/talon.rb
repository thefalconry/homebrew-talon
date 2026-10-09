# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.34.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.34.0/talon-darwin-arm64"
      sha256 "8bbdf462eee5554a8098e66e711f832c9e8604a089db253650dc4b3d2701891d"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.34.0/talon-darwin-x64"
      sha256 "aa68e3971bb8a5a87b7a712f4ebc5b40ebac274085069773b4dec992bc9eaac7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.34.0/talon-linux-arm64"
      sha256 "7c2cea88b214ae164e36849a5531f83acca14afff161c2eeac9dcfd718c359b7"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.34.0/talon-linux-x64"
      sha256 "8c176cf4dbb839587206c17607cdebbaae5975c367e770bbe5769f678ef0b5ef"
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
