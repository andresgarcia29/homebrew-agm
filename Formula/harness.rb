# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.60.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.60.0/harnessd-darwin-arm64"
      sha256 "20fc69e9b8acdeab75cbca4caeb4654efa00b3dd51dfaabdce0c345938da7978"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.60.0/harnessd-darwin-amd64"
      sha256 "65bca44caa7cdbafcfdb9b57df40eabe76af2aff96dad13fec161c4fbc8c8600"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.60.0/harnessd-linux-arm64"
      sha256 "5b7882df136207f06ab34cc2b4ce0d832b12f562a18b0d4aa31dd5458dedc312"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.60.0/harnessd-linux-amd64"
      sha256 "113891f703ab6e3e60d0c8521c5873d6bf235918cfab75be0a257478949d3571"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.60.0", shell_output("#{bin}/harness version")
  end
end
