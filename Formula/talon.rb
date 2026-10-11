# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.37.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.37.1/talon-darwin-arm64"
      sha256 "c13a2a4783f5bdd6b3e84cb10c79f910a438d9bd49ec937ef96936c442f79d2a"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.37.1/talon-darwin-x64"
      sha256 "a20206fdb9434e2126d0b9aad7494c30cd87d904f81af90ed834b8d48c83fdb6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.37.1/talon-linux-arm64"
      sha256 "b1b2ca2f2f369a20a258fc4d3ee413af0f45d966460153b3dcee220b2e984d82"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.37.1/talon-linux-x64"
      sha256 "483d8fc4cb60130bc8592670eb28225aa9e6ead8383cd783b39c8e0821100034"
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
