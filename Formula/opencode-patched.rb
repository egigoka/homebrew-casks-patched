class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  version "0.0.0-daily-20260916085043-e03db9b"
  license "MIT"

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260916085043-e03db9b/opencode-darwin-arm64.zip"
      sha256 "a8b117664a0bc5e06eb39ed022c01120d8d7a0810317ebba63636e2af8baf404"
    end
    on_intel do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260916085043-e03db9b/opencode-darwin-x64.zip"
      sha256 "0db5eb423e1d07d404a4d1eb6e0ccd7e215af7e828432a8d279b318f8d317482"
    end
  end

  on_linux do
    on_arm do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260916085043-e03db9b/opencode-linux-arm64-musl.tar.gz"
        sha256 "7da9d7f4918b30fbd6eabe3ad979c1bd1b2da4c77f247a56dfc658544527d017"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260916085043-e03db9b/opencode-linux-arm64.tar.gz"
        sha256 "dd41ab7a6c50d4e4afc0cd5efea3af2d81eaf1eb968ff5be53a911c9287d08db"
      end
    end
    on_intel do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260916085043-e03db9b/opencode-linux-x64-musl.tar.gz"
        sha256 "aa996732107d0a38f82ede38f4ba52f43cfcd2e70a9a470f18c0eef60673e47f"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260916085043-e03db9b/opencode-linux-x64.tar.gz"
        sha256 "290a7e5502bc81ae90133e9de76e9a93fa32d0a442d01c36d3e5303d77e0de90"
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
