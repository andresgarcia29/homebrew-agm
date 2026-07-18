# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.50.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.50.1/harnessd-darwin-arm64"
      sha256 "959441a760e8133c2a60b3030d70bf13ba77138bb48c6583b5223610119f6fc9"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.50.1/harnessd-darwin-amd64"
      sha256 "a0621b036c395f526b9e2f336c5333613c02e33ef60a7052ea17b714b8f8ec24"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.50.1/harnessd-linux-arm64"
      sha256 "6e6981b62ba9acffa1b00e9bd949ec0e31e20eec399580675f59ea16e6e72515"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.50.1/harnessd-linux-amd64"
      sha256 "8a621a9f114a2b364401fd2d5951d19a1923dc4048e139c0a9018af8197bab49"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.50.1", shell_output("#{bin}/harness version")
  end
end
