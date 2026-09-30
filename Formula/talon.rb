# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.26.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.26.6/talon-darwin-arm64"
      sha256 "dc928dc73d2bd649f7a207a5be55fdbca3a9a79a8ba18301ca4763940de8c4cd"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.26.6/talon-darwin-x64"
      sha256 "f7fad722801419754ea6bb1b64505619b55b5f596782406dacf94b09d0327a77"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.26.6/talon-linux-arm64"
      sha256 "44af6ed1dd848742fe07c42b2ed96aca7ab1b1a900ca4dde015728dd869d09ff"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.26.6/talon-linux-x64"
      sha256 "2beead61ec140e9eb313f64a9c4f881003c6d4ec0de3eda7c045870e507019b2"
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
