# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.49.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.49.0/harnessd-darwin-arm64"
      sha256 "5fe13d9d5f175de742420ec262d255aec05e28e2b9bbd1faeb415f44f241c10a"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.49.0/harnessd-darwin-amd64"
      sha256 "3b7ea7c800930de72a2f2c01bb72feda08768d48971ce1ddda6e0f84cdd3a86f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.49.0/harnessd-linux-arm64"
      sha256 "f042f6273e07d5ace5719ef37fa2f26e39644d999eb76e83e1b1202273025319"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.49.0/harnessd-linux-amd64"
      sha256 "7170fd46ee4838f7391912f21dacef65738d3149c638be7bdfa3d167a81cd9ae"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.49.0", shell_output("#{bin}/harness version")
  end
end
