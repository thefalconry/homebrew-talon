# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.26.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.26.3/talon-darwin-arm64"
      sha256 "cefce8e6cf3e50429f35ce6b910c70d5c3431378de6ff6cdcd930803d952d0b3"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.26.3/talon-darwin-x64"
      sha256 "4969d9a6e25ae57356d3c798084b0682e5f33066e7ee3d7d68dfe76f66dd097a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.26.3/talon-linux-arm64"
      sha256 "b4fc2f1fcdecc1e80f9b62c3d87e3535019c6916937ebf8f58359caf3fef1abc"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.26.3/talon-linux-x64"
      sha256 "7e521c6739fb4b8889510e8b43b2320b2719d345b4ca9724605c82ce2019ea31"
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
