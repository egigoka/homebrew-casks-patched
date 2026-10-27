class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  version "2.2.0"
  license "MIT"

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/egigoka/opencode/releases/download/v2.2.0/opencode-darwin-arm64.zip"
      sha256 "d6002c742ff567c8ee8d651bcd5290249fafb88b283f8479ae5f5f091635994f"
    end
    on_intel do
      url "https://github.com/egigoka/opencode/releases/download/v2.2.0/opencode-darwin-x64.zip"
      sha256 "fd55bf7ef36e6c499251f3e2f353df0068ff23306318e2e36fdb560d4ad35be8"
    end
  end

  on_linux do
    on_arm do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v2.2.0/opencode-linux-arm64-musl.tar.gz"
        sha256 "b22a15ff807378d6abdc9b3600843abebfb5432a6c904ec168b00c5088729c3a"
      else
        url "https://github.com/egigoka/opencode/releases/download/v2.2.0/opencode-linux-arm64.tar.gz"
        sha256 "518ae0636949f6e9b93bec91983a01c3b9edf88619eaceceb13e5e6b0328bed9"
      end
    end
    on_intel do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v2.2.0/opencode-linux-x64-musl.tar.gz"
        sha256 "889b6254dace40373b10f81966630db12a4d7715a695855e366fe44a4a8f0660"
      else
        url "https://github.com/egigoka/opencode/releases/download/v2.2.0/opencode-linux-x64.tar.gz"
        sha256 "f77dbf2a128210e6aa3036f64033e64cde6c6ea49e943225cca9d1e9842ffab0"
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
