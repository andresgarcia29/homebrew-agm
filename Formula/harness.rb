# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.58.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.58.2/harnessd-darwin-arm64"
      sha256 "f52adcf45146ac89ca9e8f0854bd228ca1c0a99daa19a67c592a202e6aeec2ac"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.58.2/harnessd-darwin-amd64"
      sha256 "efa047a4e819a478c018e3e8b184af5a4df666aec26c9017dc50556f6d121056"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.58.2/harnessd-linux-arm64"
      sha256 "725cb10a1f0a84125449a024baba469f85d3a28dd23f5f84739e0cd0cfeea734"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.58.2/harnessd-linux-amd64"
      sha256 "1172bd91d7157650c0330060749593b4a1853824b57d09a56ea2f50e16f4586b"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.58.2", shell_output("#{bin}/harness version")
  end
end
