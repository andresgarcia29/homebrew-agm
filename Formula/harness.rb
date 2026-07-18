# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.47.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.47.2/harnessd-darwin-arm64"
      sha256 "557a05d1aa7806fae5c98ee96be82b4c2218a434ada8d17f6b2661f7a6beec79"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.47.2/harnessd-darwin-amd64"
      sha256 "e60715bb8239453b3f3513544780fb336d17b8d4d5522844a1c5e43be815e797"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.47.2/harnessd-linux-arm64"
      sha256 "e47d860b1ef6badc864a37f6612145de1d50a5e38e60b1bd2b17e0aeb656f6b7"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.47.2/harnessd-linux-amd64"
      sha256 "d8a46fa3c26499f1fce207213b79380c6842ebc6b359ba58c1c6b75582b83322"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.47.2", shell_output("#{bin}/harness version")
  end
end
