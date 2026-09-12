class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  version "0.0.0-daily-20260912080807-95daf90"
  license "MIT"

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260912080807-95daf90/opencode-darwin-arm64.zip"
      sha256 "82e8f71e13a2d9971a0c4e9f98acce2750abc809d46d7778d7d9263f1fdfeda0"
    end
    on_intel do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260912080807-95daf90/opencode-darwin-x64.zip"
      sha256 "d995e25857c613959fc0cddaf5fe9f5ccb1c9e227d842136f28c99b53e04bba1"
    end
  end

  on_linux do
    on_arm do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260912080807-95daf90/opencode-linux-arm64-musl.tar.gz"
        sha256 "ce6c6af314fcf3b6d1447a8ee16e9101296f673f1b0f75679e943ddb388ce255"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260912080807-95daf90/opencode-linux-arm64.tar.gz"
        sha256 "07666813ce0ad6ebd37cbf26363cc924a9f627b45c31f4bc010c4e2c316cf972"
      end
    end
    on_intel do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260912080807-95daf90/opencode-linux-x64-musl.tar.gz"
        sha256 "7f3b27083f9940c95e1ecb6bf801cb97316d77f85942f60cce6c52de4aedae13"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260912080807-95daf90/opencode-linux-x64.tar.gz"
        sha256 "cfb074b07d06664df90ad40ff3cf1151c708cd8bed7744eb8671d5f197f7e2ba"
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
