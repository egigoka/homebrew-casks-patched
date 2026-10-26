class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  version "2.1.4"
  license "MIT"

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/egigoka/opencode/releases/download/v2.1.4/opencode-darwin-arm64.zip"
      sha256 "6d77b9773f8836ac7962863bb133e43441ddd3261cd215a5acbdc74719b8c5d6"
    end
    on_intel do
      url "https://github.com/egigoka/opencode/releases/download/v2.1.4/opencode-darwin-x64.zip"
      sha256 "cdb3b49067611ae7586cfe8fb10016cf7cc4ab08812d4f37bbc91816811cf139"
    end
  end

  on_linux do
    on_arm do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v2.1.4/opencode-linux-arm64-musl.tar.gz"
        sha256 "e4b7514efeeac31c6276bae9308ebdadee95c74117f8134e93e73143bab39fb6"
      else
        url "https://github.com/egigoka/opencode/releases/download/v2.1.4/opencode-linux-arm64.tar.gz"
        sha256 "e3c4fffe5839f1268e448615611552f86cea27543452603f1138733a075ee8da"
      end
    end
    on_intel do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v2.1.4/opencode-linux-x64-musl.tar.gz"
        sha256 "8c3eaa49d2db97dfbe100978a1bb96eee0e6c4e5d104268dfcbbaf29a1f9d542"
      else
        url "https://github.com/egigoka/opencode/releases/download/v2.1.4/opencode-linux-x64.tar.gz"
        sha256 "4f1c9a91704e9af95a9241df6fec867b9633f981992f82568440b211527fa1b9"
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
