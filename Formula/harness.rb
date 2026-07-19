# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.53.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.53.0/harnessd-darwin-arm64"
      sha256 "338dabebd1f65fe050e9be16940bf145091b2f661d275a19bd817a01e2fe2a1e"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.53.0/harnessd-darwin-amd64"
      sha256 "7197f1dfb0c441abc9de50157cfa35ef71e81b4a1c90d0e5d83220128baaefd5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.53.0/harnessd-linux-arm64"
      sha256 "f0d1173490a501a10b2e3521aa2ff9da817834b23a3b7799787a5e531fe1e1b3"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.53.0/harnessd-linux-amd64"
      sha256 "9288e05f018f43844c03cdf5d31c3e49fbc3ea72a53879c7eb60ddb8ff56bd1c"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.53.0", shell_output("#{bin}/harness version")
  end
end
