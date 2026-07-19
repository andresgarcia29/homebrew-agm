# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.52.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.52.5/harnessd-darwin-arm64"
      sha256 "cf7e57c70bff8d33aa712ee20cdafbfb9ad91d3199333126592aac81c46794b9"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.52.5/harnessd-darwin-amd64"
      sha256 "df4ccefef1269064f808cccfb7e340932e2026d0457c342f3b82f20ac6e6f41a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.52.5/harnessd-linux-arm64"
      sha256 "da8f064b830654d5b1f890bcd936bad3202eede0b328b1ee36a3b04c76113f63"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.52.5/harnessd-linux-amd64"
      sha256 "cdd381e6148dbe2a7659391880fdd2093c0331020b530811a799be5f7f6d48e4"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.52.5", shell_output("#{bin}/harness version")
  end
end
