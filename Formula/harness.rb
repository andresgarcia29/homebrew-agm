# Formula generada por scripts/gen-formula.sh — no editar a mano.
class Harness < Formula
  desc "Harness de ingeniería agéntica multi-repo: wizard de init, panel local y generador determinista"
  homepage "https://github.com/andresgarcia29/harness-daemon"
  version "0.59.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.59.2/harnessd-darwin-arm64"
      sha256 "ed0ff37da00984d093e6bb5b3d97a9111c430a5d0c3e5ad1e379b7f0218270e5"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.59.2/harnessd-darwin-amd64"
      sha256 "ca00cba6b0f6792633dd7c11c0521ad380ae6ad537216a435cadb10b73d21d12"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.59.2/harnessd-linux-arm64"
      sha256 "10747674e7facfc8a079c88a1e9d098a33c6dc5849a9e94d3c366f8d8c54f131"
    else
      url "https://github.com/andresgarcia29/harness-daemon/releases/download/v0.59.2/harnessd-linux-amd64"
      sha256 "030d861bcbde3743fbb474aadf34337fc27154ea78a4884a6e90e6e1898cca71"
    end
  end

  def install
    binary = Dir["harnessd-*"].first || "harness"
    bin.install binary => "harness"
    bin.install_symlink "harness" => "harnessd"
  end

  test do
    assert_match "0.59.2", shell_output("#{bin}/harness version")
  end
end
