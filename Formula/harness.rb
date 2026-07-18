# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.48.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.48.0/harnessd-darwin-arm64"
      sha256 "83918ed93f68a7a979497a936bcdaf2f087c694a9e93752c813b17f69593c9c5"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.48.0/harnessd-darwin-amd64"
      sha256 "26408c2d490e03032e2d9ade4018c754e9033f3ad33af3d2946c50603cda84a6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.48.0/harnessd-linux-arm64"
      sha256 "198a4fef1ff8b6aac53894a6415230bdc8b6caa40b6525ae21eb89d1da362316"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.48.0/harnessd-linux-amd64"
      sha256 "a2749df2229be6ab1732085e85728aac049091215ac0c2881f7ef2b56bfa641f"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.48.0", shell_output("#{bin}/harness version")
  end
end
