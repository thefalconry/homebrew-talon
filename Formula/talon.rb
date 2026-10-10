# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.36.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.36.2/talon-darwin-arm64"
      sha256 "46917984e2129ac3cada11044ccef93a8239bf761972adf37fe3553209a44f52"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.36.2/talon-darwin-x64"
      sha256 "82936f10943c9de6b3305a0df414369fa54f7c7828763e4cf19ded142ba153fe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.36.2/talon-linux-arm64"
      sha256 "2d11c9ca9baf9cf188815277a4067967d78197686d37201d85021f5c712b572a"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.36.2/talon-linux-x64"
      sha256 "341998c734c9ec45128354b2de2795c72065f34eafe8eb8db5a5ce90bd2d2f86"
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
