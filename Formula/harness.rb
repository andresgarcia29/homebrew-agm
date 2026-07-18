# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.47.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.47.0/harnessd-darwin-arm64"
      sha256 "1588aa466d75d2722187bf2057e17ee1cd848f7564c8e262b17c035115d45f4b"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.47.0/harnessd-darwin-amd64"
      sha256 "b5b65982fd57184d9d66704ba7a8d7d07312a96a0fa4eedc03055b0ee283ebb6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.47.0/harnessd-linux-arm64"
      sha256 "efe065ce66ef28a35fee4cc2e0b041738eba70e5d68bf0388c1de9adab997525"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.47.0/harnessd-linux-amd64"
      sha256 "60740ed83a7f4ec039e03fbeec45bbea904f5686426ad77beaafbf9e527b2b80"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.47.0", shell_output("#{bin}/harness version")
  end
end
