# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.22.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.22.0/talon-darwin-arm64"
      sha256 "a7337da5f24ca22946ce8fc2297301a02e0ad4bfc0e0eaa35023a744239bf1ca"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.22.0/talon-darwin-x64"
      sha256 "06623182f5e0d31dea92728ff80bfc48807143dab1859280413d520e2de2c2df"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.22.0/talon-linux-arm64"
      sha256 "6f0bdbafcc876c7b130d0ac140b416e2eb0f4d9d612f6ebd0e1cfd0267c77788"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.22.0/talon-linux-x64"
      sha256 "898a43c0dbc056a40bff2320804938e9eeec1aac3daf13ac0c63fa60e28ce985"
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
