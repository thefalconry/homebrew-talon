# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.26.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.26.2/talon-darwin-arm64"
      sha256 "876bf1bf250d5a150b4fe443404c60ee30279fb3092c80690f0c78845f9e184b"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.26.2/talon-darwin-x64"
      sha256 "f7cf42593777b710950755c3634e68410b6be92da589451adfbc488c297e1e0c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.26.2/talon-linux-arm64"
      sha256 "6d4091aff5138348d8f9cac4a69ff61a93594d44a2315f884c3e11355f1f475d"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.26.2/talon-linux-x64"
      sha256 "e6bcea303393db368f686936c262685c96e3dd751b63cda8f175711754a2763e"
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
