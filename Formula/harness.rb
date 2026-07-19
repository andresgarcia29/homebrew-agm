# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.54.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.54.0/harnessd-darwin-arm64"
      sha256 "c77ea688325d8e39524f571ecec84840f6888a991b9400ab9a5979c246ad1396"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.54.0/harnessd-darwin-amd64"
      sha256 "dbbc9f4293cb5569a221e0a44c7973c0e473c6664f1e92d836511fc46764aaff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.54.0/harnessd-linux-arm64"
      sha256 "b3fa18f5faee8829e6cbe8ce45597e38e08086be1dba0d89d118403e2e41d9c0"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.54.0/harnessd-linux-amd64"
      sha256 "976b5ed4ae170b01114e4a9a749f18995081b18815c74e2caa28c4d482b00c04"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.54.0", shell_output("#{bin}/harness version")
  end
end
