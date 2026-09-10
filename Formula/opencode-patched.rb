class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  version "0.0.0-daily-20260910082338-859106e"
  license "MIT"

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260910082338-859106e/opencode-darwin-arm64.zip"
      sha256 "2b6dbc1b0de8782aaf22737a3e43ef1cf22b9d3fc92c8ba5d68bbd54701c5c28"
    end
    on_intel do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260910082338-859106e/opencode-darwin-x64.zip"
      sha256 "93f854134bbd3234c8672cdad74a50f1b7ba6f46c59865ddcf8962f2515b66ed"
    end
  end

  on_linux do
    on_arm do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260910082338-859106e/opencode-linux-arm64-musl.tar.gz"
        sha256 "cf2ec0e7e314accca4d1909e1a5badd181e6f6d8e62cbde6c25cd9c111013f1f"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260910082338-859106e/opencode-linux-arm64.tar.gz"
        sha256 "02fcb64115663739631e5c4953c0874b333119062768ae67675e11d91195d88f"
      end
    end
    on_intel do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260910082338-859106e/opencode-linux-x64-musl.tar.gz"
        sha256 "552451ce0297025bd4cd14f0bc1a836cead353a1c204477600af7e5468740bd2"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260910082338-859106e/opencode-linux-x64.tar.gz"
        sha256 "b0217183fda5a29a8147409b99c35b3aef5f5c6570e7e73482e0e9544334d44f"
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
