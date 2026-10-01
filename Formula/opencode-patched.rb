class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  version "1.18.34-e"
  license "MIT"

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/egigoka/opencode/releases/download/v1.18.34-e/opencode-darwin-arm64.zip"
      sha256 "86ce0b75299185eb49fcae1452392d97894368c9755e85bf641801b4a743b3b6"
    end
    on_intel do
      url "https://github.com/egigoka/opencode/releases/download/v1.18.34-e/opencode-darwin-x64.zip"
      sha256 "9b896070dcfbafeb5546f69791eeaf76a58279a402003a82f478d85447359b41"
    end
  end

  on_linux do
    on_arm do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v1.18.34-e/opencode-linux-arm64-musl.tar.gz"
        sha256 "c0b7e62d3dd1ff5dd78192eacf3d2fdaf2a25a13262f2efdc53fb18977c29371"
      else
        url "https://github.com/egigoka/opencode/releases/download/v1.18.34-e/opencode-linux-arm64.tar.gz"
        sha256 "4d9b3b8e71ca28e97fe1254667c5171c40ef9b5a66d84dae2816c7fb8813f583"
      end
    end
    on_intel do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v1.18.34-e/opencode-linux-x64-musl.tar.gz"
        sha256 "1549490283f9256d835c84c4dce3310c5465cd57d84262a488eaf20abf6452e3"
      else
        url "https://github.com/egigoka/opencode/releases/download/v1.18.34-e/opencode-linux-x64.tar.gz"
        sha256 "b9b6c71a04f39c9329bf5c3a31a6bf228ecf6d428ba842fcd90f37fe2385e7bd"
      end
    end
  end

  conflicts_with "opencode", because: "both install an `opencode` binary"

  def install
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
