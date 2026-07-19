# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.56.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.56.0/harnessd-darwin-arm64"
      sha256 "cb859eb8a1e4ab0c5d67bf0d9ac4afabfd31574a8979734d3f1375d5f4b93db4"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.56.0/harnessd-darwin-amd64"
      sha256 "52ce39a806394781179b5394f23964772a1899dd6d5ad31eb67171ff103897e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.56.0/harnessd-linux-arm64"
      sha256 "c3f0a82fd3bb42e353c6f22b00c43bd08e3cfdd7d2f9c4cb3ff32b3f91fb1d50"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.56.0/harnessd-linux-amd64"
      sha256 "8b50ca25bf0a21be50118e0ec3f53fab890e3337075bc6725e7afa027126199c"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.56.0", shell_output("#{bin}/harness version")
  end
end
