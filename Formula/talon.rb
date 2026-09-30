# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.26.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.26.0/talon-darwin-arm64"
      sha256 "3e8d63dcd840a013cc52c2bf400799b9e77e75e5f590d383ac1303663e5b1c8f"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.26.0/talon-darwin-x64"
      sha256 "a0995f9ba8f861fb64f7f3e5e00fb7d25d4702c35d3b6b732fbb3d9090a9b3df"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.26.0/talon-linux-arm64"
      sha256 "caa09ce69d16c791d3d980f4b193a66bd2fa6f26a31abc2ffce28c6f87780b2b"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.26.0/talon-linux-x64"
      sha256 "49faa60ed0c4c3d76bae331bccffe4b43a4b1c052e557626186ab684b40f0527"
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
