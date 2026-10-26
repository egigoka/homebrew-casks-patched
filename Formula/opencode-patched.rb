class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  version "2.1.4"
  license "MIT"

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/egigoka/opencode/releases/download/v2.1.4/opencode-darwin-arm64.zip"
      sha256 "a985dae58c5feb435a812df407b95243e9e4c6d76f564917d2d6110f42871d10"
    end
    on_intel do
      url "https://github.com/egigoka/opencode/releases/download/v2.1.4/opencode-darwin-x64.zip"
      sha256 "a23f4a99e73cced92b0bb1bb93bbbf17016f0428b34fd708f859c8d129b35a7d"
    end
  end

  on_linux do
    on_arm do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v2.1.4/opencode-linux-arm64-musl.tar.gz"
        sha256 "1c3215f03ef877d65fe8670d234c150a6c16384d3b38c5a2f7812c3b2e807345"
      else
        url "https://github.com/egigoka/opencode/releases/download/v2.1.4/opencode-linux-arm64.tar.gz"
        sha256 "e639d380a27c2c55d7514bab98872ddfd79faa0ebec293d37ee78fb7077dd041"
      end
    end
    on_intel do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v2.1.4/opencode-linux-x64-musl.tar.gz"
        sha256 "74beaf6e85be9c89c93f0bfa0ce04b2b0dfabd3f5dec610544e7e35e19be43c5"
      else
        url "https://github.com/egigoka/opencode/releases/download/v2.1.4/opencode-linux-x64.tar.gz"
        sha256 "3f70b46bcd54c8b6a58f3bb0b52ff4dd394328138d1bab65b5240f98793f8279"
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
