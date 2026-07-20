# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.57.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.57.1/harnessd-darwin-arm64"
      sha256 "32db11455392aac60c7d0003c236d0e4ad9db7fae8136f48c58bb91f62f81c78"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.57.1/harnessd-darwin-amd64"
      sha256 "8e9404434454d13dd92b95669e08ec7e0ffa8fc415ccd527541aca25259fb12a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.57.1/harnessd-linux-arm64"
      sha256 "dc20a11aef6d6fd57ed06a2a2c49b14897f133c7307b1d9a5e7a5ec8f44ec7a5"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.57.1/harnessd-linux-amd64"
      sha256 "1c9fe6e22af9942ce46904fbcaec169099860f1bfcefc1371c43afbd9d270feb"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.57.1", shell_output("#{bin}/harness version")
  end
end
