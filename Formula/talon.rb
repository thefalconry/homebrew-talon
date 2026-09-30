# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.26.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.26.1/talon-darwin-arm64"
      sha256 "65ff2528cbe47ed612371ecb5045e741dc3d7b391faa49f031f7e30a66215ce7"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.26.1/talon-darwin-x64"
      sha256 "5e0f5305da04c963c94cd8a0e2bc7204a3ec1214caeaeb34e72773e7269d4944"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.26.1/talon-linux-arm64"
      sha256 "c0584e3437798ab45837090b75f3d372b866507bc52942c7cb05f91f0e1ba9c5"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.26.1/talon-linux-x64"
      sha256 "d855bd57e5a1e6542c086b274c472bace529bebee582960a72b126b86f567243"
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
