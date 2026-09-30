# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.23.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.23.0/talon-darwin-arm64"
      sha256 "e8ba7257b3c0e27962c1dfa6c93dfc82440ebc9adde79d2bfe4b14e50d8a76a2"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.23.0/talon-darwin-x64"
      sha256 "23a0ec48fb061838373f873ed60d2a3957771f2cf586ca9bf5a186bfcdf04201"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.23.0/talon-linux-arm64"
      sha256 "4590df358a57ee1f2dc0a7aa25b02a7ad5b3ee0a7eef9537a8668d612b08e3d9"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.23.0/talon-linux-x64"
      sha256 "3c7fc11bf2dd2f4e4de536796dc92d609c5eed162e815b2cfee1a83ffd5a0cee"
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
