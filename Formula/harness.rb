# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.51.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.51.1/harnessd-darwin-arm64"
      sha256 "581b6e9eb414124cd5f7ee6ef08f146c427a12eafdf65249db628ef7d8b7942c"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.51.1/harnessd-darwin-amd64"
      sha256 "0a65a0d430d7bad51ccfe9cbcbb2699c7efd3d38068e4bc4f25afb65649edf45"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.51.1/harnessd-linux-arm64"
      sha256 "9fffc3d969c6cdc63cddee9dc03b3ce3383cf2acfae35dbf84c98d7138dc434a"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.51.1/harnessd-linux-amd64"
      sha256 "8938b1759a2a3a306fa0694e38fbd876f5ed5428dbdcabb6bacbc5ddcb7af6f2"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.51.1", shell_output("#{bin}/harness version")
  end
end
