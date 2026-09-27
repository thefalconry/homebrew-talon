# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.19.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.19.1/talon-darwin-arm64"
      sha256 "a8744a50cb51e04ba5534d1b006103b7584fbcf38bbcdb48372e0b435e11a532"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.19.1/talon-darwin-x64"
      sha256 "e7284b3af8235fa0f35d3297a260cb4bc663ddc044fe2d76d246e0d8c80c3c98"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.19.1/talon-linux-arm64"
      sha256 "855d271862ad86c61a636e2f416e8dde91051711f9a338213f4b98df3c876e1d"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.19.1/talon-linux-x64"
      sha256 "41f392f9c90ef23cd88af6bc33c40ccb1292874cee16bf8806e7594dd6e4a322"
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
