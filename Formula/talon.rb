# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.33.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.33.0/talon-darwin-arm64"
      sha256 "3df64bcaea3d72c422b9d225f00d0d4ada8437e72aec41c6cb9363c7d0c31712"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.33.0/talon-darwin-x64"
      sha256 "fcada6d30372271c02cca4e1d150320e29997405bc0da0e8afbf769020045e2f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.33.0/talon-linux-arm64"
      sha256 "d506882114d07018c7a2d476b075e27d3958bcd955a6291ce753539fe9dba0d5"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.33.0/talon-linux-x64"
      sha256 "48e53d6db0ff76f0ee9d9ba6dbb4184f7b7ac5e8bc78bc82ad36c3be5c36f732"
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
