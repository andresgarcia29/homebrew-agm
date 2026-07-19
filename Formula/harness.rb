# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.54.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.54.1/harnessd-darwin-arm64"
      sha256 "a17c335bda8598dc35872a456121c8ea6a1cba1fad91f18be32535c64cd22436"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.54.1/harnessd-darwin-amd64"
      sha256 "ee3005d6dfafcbc3da6fed3319d6ffcdfb4d71c02f7108016f64f4c0299469fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.54.1/harnessd-linux-arm64"
      sha256 "0d148c8c1639206dc3c42146b80a2310d530534530e3e16d55fa88879efa8195"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.54.1/harnessd-linux-amd64"
      sha256 "b666a35a2aaed77de1d88bcfeb54ca3b2f52dcfa57dd17dfebf7111d0e76730b"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.54.1", shell_output("#{bin}/harness version")
  end
end
