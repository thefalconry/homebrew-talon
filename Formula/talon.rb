# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.39.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.39.1/talon-darwin-arm64"
      sha256 "d1cdc6c62450daec50819add24ab18ade35df61f03a9bbd05cb5813dec15778e"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.39.1/talon-darwin-x64"
      sha256 "2c5ca4d5f9c855518cebac5c3c682b8a2468c3545687919466a3ea66e1c3cae3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.39.1/talon-linux-arm64"
      sha256 "8a6d3140c79f865ee9478934dca1b69c10bfd835ae42e337e7924b9e6aea8643"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.39.1/talon-linux-x64"
      sha256 "af325ad35167fa0be5271d847f01dc66748da0f9460721a06e75116268835ba6"
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
