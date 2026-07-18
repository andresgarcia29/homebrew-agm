# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.52.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.52.4/harnessd-darwin-arm64"
      sha256 "d72c9f80329643c6cd5892cfea0bac645ba58ab9d942fceee470058286b7cdd5"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.52.4/harnessd-darwin-amd64"
      sha256 "bdf41077397155ba3f26bc616786579be8c05084e7c8b8c9ba776cb966a8a2e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.52.4/harnessd-linux-arm64"
      sha256 "132ae76a69f95e4102a951022e3ed5c0220284c017d6d41f1716874820d0a32d"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.52.4/harnessd-linux-amd64"
      sha256 "3446a6aa439b67fbdbe37f6d08e12c49aa336ad79a863e13f2e6a4204af8cc54"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.52.4", shell_output("#{bin}/harness version")
  end
end
