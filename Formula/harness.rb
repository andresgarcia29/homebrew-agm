# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.58.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.58.0/harnessd-darwin-arm64"
      sha256 "33d5ad3dde5887e59b6888a8e901f0777a2b6514ac1c093bf814dde0a7e280c2"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.58.0/harnessd-darwin-amd64"
      sha256 "1f19cf7fa099cf8b1892a16174ff6471af27d7dc7489f8c155fd5dd9078ae1b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.58.0/harnessd-linux-arm64"
      sha256 "18a70bcc3711f9132890395191e906360a12beb006067d0e18225419e96fc09b"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.58.0/harnessd-linux-amd64"
      sha256 "b572b9dbeaa11c768383e4e28afe64ef728e6506f6cb5ee1374a577df2d3b129"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.58.0", shell_output("#{bin}/harness version")
  end
end
