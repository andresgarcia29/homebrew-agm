# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.52.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.52.2/harnessd-darwin-arm64"
      sha256 "7b94b90fbab7c2defac8f4fb9a26ea7652a77a012f906bd68175ce7df147ffe6"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.52.2/harnessd-darwin-amd64"
      sha256 "7624db02d8fe3a78c94d5df4b5bd4b90756ef19f10537cd785f128b4d3742710"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.52.2/harnessd-linux-arm64"
      sha256 "66bec21cac71f14295062be34947beae8183b3e3cea41465f064b8c1f5eb3747"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.52.2/harnessd-linux-amd64"
      sha256 "c451253ef42984ed9383a87ed3f2090af595bafb0a3208d3701f30f6d13d00ef"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.52.2", shell_output("#{bin}/harness version")
  end
end
