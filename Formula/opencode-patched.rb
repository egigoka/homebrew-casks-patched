class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  version "0.0.0-daily-20260917085423-88c6c7a"
  license "MIT"

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260917085423-88c6c7a/opencode-darwin-arm64.zip"
      sha256 "37796d2f6d19818507fb866bef009adf65b53b0a354b0f19902fb9bc1a1f5579"
    end
    on_intel do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260917085423-88c6c7a/opencode-darwin-x64.zip"
      sha256 "9dd2c1c56e24fd875478fc71f8b7091a5b55fb4d087177fa00f1c4c717342e6b"
    end
  end

  on_linux do
    on_arm do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260917085423-88c6c7a/opencode-linux-arm64-musl.tar.gz"
        sha256 "8ac2b217c3ad8065334b85847c8a307de3aa93c888ad5ac4e973362cabca3c2d"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260917085423-88c6c7a/opencode-linux-arm64.tar.gz"
        sha256 "3b0bfdfde2cf6e1df97fbdfd7a60bf8e70bb577f25a5cb11f2f0f61c1257b148"
      end
    end
    on_intel do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260917085423-88c6c7a/opencode-linux-x64-musl.tar.gz"
        sha256 "996059dea8ee2289ac8ea235aced16bd633a3c6ddfcb2690dadb4ca3e7672660"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260917085423-88c6c7a/opencode-linux-x64.tar.gz"
        sha256 "063b7c63cb4721d0e99536ae4f10fd9177de1de7335a8b500cd7dad8c00a22b0"
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
