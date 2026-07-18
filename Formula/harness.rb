# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.50.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.50.0/harnessd-darwin-arm64"
      sha256 "144e140e078a97082f8e0704b3c8564f3fbde8eb319432671fe2e5e490a94683"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.50.0/harnessd-darwin-amd64"
      sha256 "4a1ac5afee351e18c1144e5f616e222ab827d9e3c0119eb9ecdb0e61532a79bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.50.0/harnessd-linux-arm64"
      sha256 "3c007af11d7b20e547df2d76f154e3ae22e2cbbd029d27f563d27ba73275620e"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.50.0/harnessd-linux-amd64"
      sha256 "565295190b63201f6e2523662fb7c981af3266c2f0742c42878c5f5ce4c3ecfe"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.50.0", shell_output("#{bin}/harness version")
  end
end
