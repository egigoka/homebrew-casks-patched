class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  version "0.0.0-daily-20260915085817-e03db9b"
  license "MIT"

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260915085817-e03db9b/opencode-darwin-arm64.zip"
      sha256 "c1c148d204479927cf1ede276c20ebe94c59d8f3112f8ba87f84504407a53c0a"
    end
    on_intel do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260915085817-e03db9b/opencode-darwin-x64.zip"
      sha256 "324eab23dec186d0f14c564f93fb614a09003f91e746dcd2ff6f92ed23f8bc80"
    end
  end

  on_linux do
    on_arm do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260915085817-e03db9b/opencode-linux-arm64-musl.tar.gz"
        sha256 "34c8863fa9657998ca1fd1328b9fe02e08971a3487ccd9b72ed9da5afa9aea1c"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260915085817-e03db9b/opencode-linux-arm64.tar.gz"
        sha256 "c60c0cad7545e03d04fa7aa8cc2861a6dd56e73c49008e4954e15d61a1c7947a"
      end
    end
    on_intel do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260915085817-e03db9b/opencode-linux-x64-musl.tar.gz"
        sha256 "073df95b0fd80175a83705e58b1e70f2a9b3add2d9f66a747483f4c1e5af03cc"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260915085817-e03db9b/opencode-linux-x64.tar.gz"
        sha256 "0b671815d8c734fe6771609660a48395aae616267decc4b4f4738eff4d2aab27"
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
