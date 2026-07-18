# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.47.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.47.1/harnessd-darwin-arm64"
      sha256 "e565c47f514a3790e5feae0e6d6564498a08c636878f7990b86a7fa421b54ca6"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.47.1/harnessd-darwin-amd64"
      sha256 "15e7044ce2c4448b38eec8f17f861aa429b970abe084daef7af6520dbd090570"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.47.1/harnessd-linux-arm64"
      sha256 "1fa97712cb10502a7191a722896c76a5a9f70c46d50e290ecf101536b90c56ca"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.47.1/harnessd-linux-amd64"
      sha256 "e189979f004241ef79f7ef3ecab8bdbc1c719813f5f4c354557bd6998b67292b"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.47.1", shell_output("#{bin}/harness version")
  end
end
