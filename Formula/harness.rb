# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.52.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.52.0/harnessd-darwin-arm64"
      sha256 "e61d6e81aa76d2fafa177a372f050ddf9ad8c6d2be3e70f0af9dcf6e40a615de"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.52.0/harnessd-darwin-amd64"
      sha256 "d8a75707dedea862214af3358db8d2096ec1fa98c087c3a188c9df25436a95ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.52.0/harnessd-linux-arm64"
      sha256 "f14cdde001ede46876f4665a7d64ee7e6e250ceadf7b1fafd059fa70213f73ba"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.52.0/harnessd-linux-amd64"
      sha256 "a5f4f853dbeb4f16e153a3723db7298475454c85f3c5723c21bf43ce2d1d8b67"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.52.0", shell_output("#{bin}/harness version")
  end
end
