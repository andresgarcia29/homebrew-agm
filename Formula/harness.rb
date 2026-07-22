# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.59.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.59.0/harnessd-darwin-arm64"
      sha256 "b6866a8a6ae47f9366f4f5905ad2227bc01a07a8843da78abe0108269a2ae3cf"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.59.0/harnessd-darwin-amd64"
      sha256 "63f9daaa433fa721838636eb38c80c4d588671a67cba2ec6784f8bee13636238"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.59.0/harnessd-linux-arm64"
      sha256 "b69d5d0a1a72a3ea7eba39744121db83b757a9be1ea69b1dd2e7ed2c63f184ff"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.59.0/harnessd-linux-amd64"
      sha256 "03bef24957cd92da3a792501da63eb2948cf406626cec4a051204651237d9c4c"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.59.0", shell_output("#{bin}/harness version")
  end
end
