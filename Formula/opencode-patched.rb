class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  version "1.18.34"
  license "MIT"

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/egigoka/opencode/releases/download/v1.18.34/opencode-darwin-arm64.zip"
      sha256 "e68833f5fc4eb660bc5a2a377323ae43e3174080a08864aecc923c1fbbfd8c4b"
    end
    on_intel do
      url "https://github.com/egigoka/opencode/releases/download/v1.18.34/opencode-darwin-x64.zip"
      sha256 "ea4b935f371524f173be2dd7fba7dbe0757a6459a8ba2b3e196b9f61677f0be0"
    end
  end

  on_linux do
    on_arm do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v1.18.34/opencode-linux-arm64-musl.tar.gz"
        sha256 "befd307d16cf1b2ba2fa88650408afd4dfa41566185cdd376345c91d88bfc9da"
      else
        url "https://github.com/egigoka/opencode/releases/download/v1.18.34/opencode-linux-arm64.tar.gz"
        sha256 "cd8ba4b335ff6ecbd8abc9df4a40a9a4ce0a3bfb7aac6bcea47be82eed5f7dcf"
      end
    end
    on_intel do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v1.18.34/opencode-linux-x64-musl.tar.gz"
        sha256 "f0d6dca81dede9f8576e1fa45e45632b0c1c949d2e3f79dc31c7f0c4c4493b69"
      else
        url "https://github.com/egigoka/opencode/releases/download/v1.18.34/opencode-linux-x64.tar.gz"
        sha256 "5dc4e2767ff322ce47d8e852118b28c624f9034b32247500307228e4bb65a8d1"
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
