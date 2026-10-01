# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.30.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.30.0/talon-darwin-arm64"
      sha256 "f84dc7a49012db304c0f48704155f64eb50fdad7e1077ed732821721c0142dbf"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.30.0/talon-darwin-x64"
      sha256 "33e69f08e4680aac8b4fe96d0d68c4e822f6f57bfa1f8e048162d61645c69fe7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.30.0/talon-linux-arm64"
      sha256 "d739e38a87fe2bd5c8c02ba2967aee84ec1b675658ccaa8079d5a563a6b584ba"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.30.0/talon-linux-x64"
      sha256 "76c7dc2e15ce3150d8f28a5b39e88a436f1757557409e94526046ee923c51d75"
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
