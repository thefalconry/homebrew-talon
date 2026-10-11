# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.37.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.37.0/talon-darwin-arm64"
      sha256 "59a4955b28b4dd73f5508d375418101847a14c85c2e83a3cb646f420d67791e7"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.37.0/talon-darwin-x64"
      sha256 "3ab43097658c9184fe19a3e65bf7c11ff73d5ca06df8ded8afc0cdad655e4225"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.37.0/talon-linux-arm64"
      sha256 "7aadca33926d808f0ce3f75fb94519ecc6cbd8e930bfa8c4556b68dc058beace"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.37.0/talon-linux-x64"
      sha256 "8e45f5a6e8028ad9bfa4bdafca0e464020e1b5bab20d03948d092bca4d010ee4"
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
