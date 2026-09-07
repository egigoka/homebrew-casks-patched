class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  version "0.0.0-daily-20260907083838-57ef382"
  license "MIT"

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260907083838-57ef382/opencode-darwin-arm64.zip"
      sha256 "b68e59cdeb1b20ac65b9525bcaaae0b4b56baadffc0e1500f0ddb77cc8c18a27"
    end
    on_intel do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260907083838-57ef382/opencode-darwin-x64.zip"
      sha256 "ebe3a61791ebeae2de1511b23012974cdadc5ae915dc9e55148c91d6b9b6a67b"
    end
  end

  on_linux do
    on_arm do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260907083838-57ef382/opencode-linux-arm64-musl.tar.gz"
        sha256 "14bd452803f86309936e73c725660d217ab4b6c5f154a3b2c980b4bf521f9f37"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260907083838-57ef382/opencode-linux-arm64.tar.gz"
        sha256 "fd1a8d5929886dc9bf7a02ef2be0a2df79105d8baa71f2e5e716b9ae87a4fe9c"
      end
    end
    on_intel do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260907083838-57ef382/opencode-linux-x64-musl.tar.gz"
        sha256 "babea001d1ec1a7b7d60d287c7e213d40bb61534a8febfa339981df918d9c266"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260907083838-57ef382/opencode-linux-x64.tar.gz"
        sha256 "450b1b151dd2f788c4f4f634fd9bb79f80c1f4350013edf2dff1c6f4cfb683bf"
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
