class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  version "2.2.5"
  license "MIT"

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/egigoka/opencode/releases/download/v2.2.5/opencode-darwin-arm64.zip"
      sha256 "c72f7260861e399e70f157e93f55849de97debb6bebed008e568dddc43a48a82"
    end
    on_intel do
      url "https://github.com/egigoka/opencode/releases/download/v2.2.5/opencode-darwin-x64.zip"
      sha256 "d256fa45ad17d1b3dc0dd1ee8875de34efea148adafecd73fa3c583f19e0bf30"
    end
  end

  on_linux do
    on_arm do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v2.2.5/opencode-linux-arm64-musl.tar.gz"
        sha256 "ab46fb46aed39d888f082314f6635b571353dbd4e349f301c17e00e9d4d501d6"
      else
        url "https://github.com/egigoka/opencode/releases/download/v2.2.5/opencode-linux-arm64.tar.gz"
        sha256 "32c14f8dcdd12c7447dc3e06809f0907d1f8509a46b941fd886386b695b18585"
      end
    end
    on_intel do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v2.2.5/opencode-linux-x64-musl.tar.gz"
        sha256 "06b6a834008d14cedddea6d2d9b5eee057c0c84fabffd18fdc998231df7ec54b"
      else
        url "https://github.com/egigoka/opencode/releases/download/v2.2.5/opencode-linux-x64.tar.gz"
        sha256 "f05178c39d78d164e0833513c57292dd0bb240f031d86e3efc399bbabc6a89f5"
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
