# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.38.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.38.2/talon-darwin-arm64"
      sha256 "b5cf3fe31c33f26dd24f2ef493519c325da87d0d49ae529265af32b09869d297"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.38.2/talon-darwin-x64"
      sha256 "5aa8515cf43bdc1fcb1a467d9be42e6fdf80e3dc2dc24a02a44170ed6d226b17"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.38.2/talon-linux-arm64"
      sha256 "34d378583943c0d2f321a0f3ae9cbbda5b718afdbb415663eebdfd1b8ac0a721"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.38.2/talon-linux-x64"
      sha256 "390c0dbcbaa9da7f1d42397f386d4a3d807fa839d4cd56688d293bba3bf6dc43"
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
