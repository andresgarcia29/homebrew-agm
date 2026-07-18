# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.52.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.52.1/harnessd-darwin-arm64"
      sha256 "b835af059240ea6616bfae56083878f49381c5d1550bf87cdd6de8553d22b489"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.52.1/harnessd-darwin-amd64"
      sha256 "7b2163896c1c1096539aada2103e6765ec937ed57b93c66d36d9773528f7140a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.52.1/harnessd-linux-arm64"
      sha256 "85b8a094d2e1279f645225dbab449d90db04ffac864956137858a14e9add9f04"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.52.1/harnessd-linux-amd64"
      sha256 "1dc24f1cdada064391f08d603ef04e4bbe02e82bbe87a1b400c8ee5427489d08"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.52.1", shell_output("#{bin}/harness version")
  end
end
