# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.28.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.28.0/talon-darwin-arm64"
      sha256 "e40f8891540ba266d5dd27a72f839b81bea50df51fbb0158e51216ed5c42e487"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.28.0/talon-darwin-x64"
      sha256 "e799ec8db512afd681994a4dfd904708aaf41600cedbdea5b15704d69488cdba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.28.0/talon-linux-arm64"
      sha256 "8ba48a4b8462bf70572ead3eca9971b08281ac2fb4328cf3a4ed8691ace4468c"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.28.0/talon-linux-x64"
      sha256 "3d7f4312003b6aff014b992c45826a53c4031fc96113fb627a5649a846281a84"
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
