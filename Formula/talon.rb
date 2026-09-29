# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.21.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.21.0/talon-darwin-arm64"
      sha256 "9c9aea2bd05fcc79403ec1668b0316fd2d2e0df58eb7a1ef0356ea4246ed4d17"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.21.0/talon-darwin-x64"
      sha256 "87d4d76d49e39a7981e2c06e1998773bdcfe3bc27c1a9a47395040801df17182"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.21.0/talon-linux-arm64"
      sha256 "f34d7857bcf3b64413d6ea634baee03cf03612d279bc86777e316c6e1d090353"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.21.0/talon-linux-x64"
      sha256 "6248161eba57a73212dc7d972381a998a859e232244174d22cb24b74fe7d07e3"
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
