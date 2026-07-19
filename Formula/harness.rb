# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.53.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.53.1/harnessd-darwin-arm64"
      sha256 "227064865959fe648f0506dbd2bfc54c5d0a74cb1d05e560790e7922bd93aee4"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.53.1/harnessd-darwin-amd64"
      sha256 "32f4437f836493b078af14cca72a7b05baa282f7d28ea06119686bf80e613e81"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.53.1/harnessd-linux-arm64"
      sha256 "77060bd6aa9c85857eb094cf8571ac49bcf622212ec9e4a1aae1c5345568d8ca"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.53.1/harnessd-linux-amd64"
      sha256 "803dd2b380a192a310fe6dfbdda3074eb6afe9fc2b66e9ec8c380bfd51891b95"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.53.1", shell_output("#{bin}/harness version")
  end
end
