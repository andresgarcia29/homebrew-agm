# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.59.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.59.1/harnessd-darwin-arm64"
      sha256 "3330ca4ad672e6b176e9d2034645aed439d80df88ca9d95410f0e47b7daac8f8"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.59.1/harnessd-darwin-amd64"
      sha256 "1a887a08f15664f39f9af9a4b2e544fce3a46f78e7bccabf8d84ec752cf92be5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.59.1/harnessd-linux-arm64"
      sha256 "d97f94329a10ed53d991dd80a2c1d8da4416d0b9ad97ef9f4fd55a138a4a30db"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.59.1/harnessd-linux-amd64"
      sha256 "8cf620ad1d43d6e3474ab98d6084c22a13a1632ce946b6206f77d1b793a47928"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.59.1", shell_output("#{bin}/harness version")
  end
end
