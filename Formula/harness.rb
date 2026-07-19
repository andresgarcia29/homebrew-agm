# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.55.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.55.0/harnessd-darwin-arm64"
      sha256 "d2c41e278f8cca70b2b7698508f870bcf914f2ddbc0939f27ec76ea0b7c90cc2"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.55.0/harnessd-darwin-amd64"
      sha256 "a5d6dd8b191825b69fb65f05ef3a9250796aa986225f17f4849ef8d554dbff4b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.55.0/harnessd-linux-arm64"
      sha256 "2ef7d46dacec517af0f1d3dfc736ea06732f57ab851751a49af0f60db3dbd5d7"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.55.0/harnessd-linux-amd64"
      sha256 "7c56bd1b52994c5737fcd2c1cec2fd8b1e48d3db93135e3965791ba436a2acf1"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.55.0", shell_output("#{bin}/harness version")
  end
end
