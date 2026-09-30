# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.26.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.26.4/talon-darwin-arm64"
      sha256 "2777386603e6056ae3c2fc3d89a13b3e1483f718ad0384b1cbe4a3f0364420d3"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.26.4/talon-darwin-x64"
      sha256 "a42732ad62b54d6f7d53edc7ab00cd2bedc5b11f742e6e62d0e1d6c9b9de2bf2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.26.4/talon-linux-arm64"
      sha256 "9015746b816dcf334db38bc773eb8a87309da2baeaa6e81142cf7bac6358d37b"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.26.4/talon-linux-x64"
      sha256 "5a4d416abe9eeb209ae143e25cf5d068bf4836c3f25c5c7910a49c2e5c2aa742"
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
