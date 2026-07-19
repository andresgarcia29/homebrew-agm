# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.55.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.55.2/harnessd-darwin-arm64"
      sha256 "349716a1515d64875c2b6814c23344d3ebd8cbe606442cdf787154123051cc5c"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.55.2/harnessd-darwin-amd64"
      sha256 "761e4b52544b3872e3e47b590b108b4bcd0f300149d7d95959443d1e1b07c1d3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.55.2/harnessd-linux-arm64"
      sha256 "da80b381ea80cbe7589e48f202a9eeb519df0597c42ed235aaf04650ee95f6a3"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.55.2/harnessd-linux-amd64"
      sha256 "b5bb93949069dc32106dbf4fe652928e52807e2cfda5ea2b62dcdf4e038791a6"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.55.2", shell_output("#{bin}/harness version")
  end
end
