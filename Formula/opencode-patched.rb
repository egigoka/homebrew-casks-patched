class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  version "0.0.0-daily-20260913083230-95daf90"
  license "MIT"

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260913083230-95daf90/opencode-darwin-arm64.zip"
      sha256 "097436e5421b50acc89b4941f1b9538aa6d01a06ac5a43522b21304c879ac7a7"
    end
    on_intel do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260913083230-95daf90/opencode-darwin-x64.zip"
      sha256 "104de74f2d68a375d67336fa2a614607047035e4f627e597ecd811af2bf58b53"
    end
  end

  on_linux do
    on_arm do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260913083230-95daf90/opencode-linux-arm64-musl.tar.gz"
        sha256 "23a301abbdab8d467a6c6bcae40d3a2b35be37841fb2a2cd5bae6819d6c6fbc9"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260913083230-95daf90/opencode-linux-arm64.tar.gz"
        sha256 "5eff39742a4b3fcb5f64a37776665d6cd25c4b2a8d52af9103ec73fea273f28f"
      end
    end
    on_intel do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260913083230-95daf90/opencode-linux-x64-musl.tar.gz"
        sha256 "236dbfdae2d75b490d8c631a3825a9ae8f1ebc45185bb3ac718d76c408a269ab"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260913083230-95daf90/opencode-linux-x64.tar.gz"
        sha256 "8080644694758681811aad26ea1d531a9e0f72b3338f9ad49ce8f9f864fe4d9e"
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
