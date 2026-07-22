# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.58.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.58.1/harnessd-darwin-arm64"
      sha256 "a71d5cb8a65c1ce2ab03c5f98beaa6fd8870cf835c625c646bb96f7c322a9ba9"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.58.1/harnessd-darwin-amd64"
      sha256 "3a804c7383bc3eba4e6606110eb7f3417d63dbd88da1c4443124bef85e06e806"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.58.1/harnessd-linux-arm64"
      sha256 "ace88efbaa34b5b27e8a747f744151f974ac7b8a572a834e761208c3ff3e1e56"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.58.1/harnessd-linux-amd64"
      sha256 "d5fd4ee2662fe8ea1d3fe34b6247a29e43e37cef3d12971baa4f85acba396fa0"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.58.1", shell_output("#{bin}/harness version")
  end
end
