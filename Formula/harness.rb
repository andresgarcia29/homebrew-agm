# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.51.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.51.0/harnessd-darwin-arm64"
      sha256 "0fa0136847688f7097d2fbba7ef643a8dc289c58c434f6c287f566b43cf3ac32"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.51.0/harnessd-darwin-amd64"
      sha256 "89b46e379e691848c0c440318167a173d6b53324f57466e14af9e7bf2a56f382"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.51.0/harnessd-linux-arm64"
      sha256 "887eba2969bd31b032a1c7f91669729933c9e01c318470fd5d3251ecf0d64bcf"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.51.0/harnessd-linux-amd64"
      sha256 "4226ec52a068f7eb029e235e140e51c8f633a3e9a1af695a211c8f99dabd57be"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.51.0", shell_output("#{bin}/harness version")
  end
end
