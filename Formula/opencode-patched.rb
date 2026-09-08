class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  version "0.0.0-daily-20260908074549-d6855b6"
  license "MIT"

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260908074549-d6855b6/opencode-darwin-arm64.zip"
      sha256 "91a26326b03ec21bb2cdc486b4790679ca345d42584d62cfb3042bdf557368d2"
    end
    on_intel do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260908074549-d6855b6/opencode-darwin-x64.zip"
      sha256 "e935132f63930a6e7fcef194b0c97ee26406707985b4fbb7e40a7bc488d84332"
    end
  end

  on_linux do
    on_arm do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260908074549-d6855b6/opencode-linux-arm64-musl.tar.gz"
        sha256 "6a6d155c0df5a26f8423f3ee553fcdb71a0c78be01bdf1b8040d92fdfb811482"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260908074549-d6855b6/opencode-linux-arm64.tar.gz"
        sha256 "ed110d4b48507d11d4d393b8639fa9e98e460d8eed62d916ee36d562e017bef8"
      end
    end
    on_intel do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260908074549-d6855b6/opencode-linux-x64-musl.tar.gz"
        sha256 "f727e0fa471213c07441e8ec2bc2ff4a76a329a548ffc54f6493bdef69e6cf0b"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260908074549-d6855b6/opencode-linux-x64.tar.gz"
        sha256 "12bbaf2adcd4398df8157dd8b25b7e37a403e5a253313eacd0c38daa5e458b69"
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
