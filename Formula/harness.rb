# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.59.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.59.3/harnessd-darwin-arm64"
      sha256 "363eeaea96710e08072174bd30a0bafe375d3bd8903682ad8f69a7fb58a91682"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.59.3/harnessd-darwin-amd64"
      sha256 "2914a64d510251e076f9358519853e29571940503260a2a288fdf52d6ad2e7f4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.59.3/harnessd-linux-arm64"
      sha256 "1f98ddd14f3f9f40567a8cd0d4f316da79786c4f6df0de759af7f59ff9e1c72f"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.59.3/harnessd-linux-amd64"
      sha256 "b5ac2e2c2946ab0631371e24c3930e1f32898ce4a7f4ddde6d88470910984538"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.59.3", shell_output("#{bin}/harness version")
  end
end
