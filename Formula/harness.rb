# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.52.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.52.3/harnessd-darwin-arm64"
      sha256 "b4729dc7bc1f9e3bd447ea01baab43fdc38b10d0ac76c800eaf4afe4c236cc5f"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.52.3/harnessd-darwin-amd64"
      sha256 "d7ca5130b067dd667dbf82f8468c30abdfc21309b8b0e6f1d7f000c3c96a94ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.52.3/harnessd-linux-arm64"
      sha256 "8a33b002d5c2b3ad901096261ebf58a0317cfa64e4cd50309b44b183d7ea5768"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.52.3/harnessd-linux-amd64"
      sha256 "3680ae2b6e045555c8ccee80945dcb830f44182d44f93bb1b843dd9d6f84d487"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.52.3", shell_output("#{bin}/harness version")
  end
end
