# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.23.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.23.1/talon-darwin-arm64"
      sha256 "c0b4f21026209c17a9d810a0ffe9719a1056e6471d9a24b00d8102dbc2e12759"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.23.1/talon-darwin-x64"
      sha256 "bc0cf4569dca0dcf5fc7275bcc7f7606cf38de3f99a438500ba8560604f69c10"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.23.1/talon-linux-arm64"
      sha256 "a7a92eae8f87a43d339b509cde727b34586a05bc9de5e47a2d6fdc50abefa4ef"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.23.1/talon-linux-x64"
      sha256 "c0ddd8f2716ed4ce578fea3275086b78895766e877b33e1c55ebdfcd83a536a0"
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
