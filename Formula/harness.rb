# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.57.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.57.0/harnessd-darwin-arm64"
      sha256 "3aef7498be6771cc1cbddbb7c4676b051c2cf48ec85daf8678e2df716669f839"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.57.0/harnessd-darwin-amd64"
      sha256 "160a5fd27ed243ac3a5c0310e13199ebc4fc93a216bee2e8f5bea4044e4136f0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.57.0/harnessd-linux-arm64"
      sha256 "48d3dccffcfc2f4feafbb63ab2b4968b44fb69bcdee611db661b546119ecc10c"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.57.0/harnessd-linux-amd64"
      sha256 "0c9598b23f959f95de625020826c84b52d91d5f609e1172309059b053f2495bd"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.57.0", shell_output("#{bin}/harness version")
  end
end
