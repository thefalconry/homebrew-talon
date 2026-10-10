# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.36.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.36.4/talon-darwin-arm64"
      sha256 "8950b403e24ff81221da539e6cbc86da1be50b87532890d7a372a9c6944b02c8"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.36.4/talon-darwin-x64"
      sha256 "7ffa181a2937178eb2b123e9fc319a29c85163f616a022ae4cf4e9d0c7f2d266"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.36.4/talon-linux-arm64"
      sha256 "9ecb7b0e2527b4a408378f6ee62fb70f025ed114a73da8ecffd910015eaea1fa"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.36.4/talon-linux-x64"
      sha256 "0b9d5975540441e3a2df5ee0c78e7ae8b25fcfad511b3bf226d0045d95ccc28b"
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
