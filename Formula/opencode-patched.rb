class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  version "0.0.0-daily-20260906083359-337fd14"
  license "MIT"

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260906083359-337fd14/opencode-darwin-arm64.zip"
      sha256 "be088282f34932b07cf532dc7af6e58ba4522a479847403e773c25c09e905dcd"
    end
    on_intel do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260906083359-337fd14/opencode-darwin-x64.zip"
      sha256 "893f5d0d52cbab1198780e434a2951ed615e772393c8f1a19374624f3adae92f"
    end
  end

  on_linux do
    on_arm do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260906083359-337fd14/opencode-linux-arm64-musl.tar.gz"
        sha256 "520b1aeed8d3d79f0093548f3f3f26a3324f3856719aba9af3da2c7eebb6cfa6"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260906083359-337fd14/opencode-linux-arm64.tar.gz"
        sha256 "e6f65ed285b457ad4109734ad7e1c3b026006ca676628ff6c5071ce23e23361d"
      end
    end
    on_intel do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260906083359-337fd14/opencode-linux-x64-musl.tar.gz"
        sha256 "b31a62d8a331a56b763135070e18f03bfc777029ce26c1dfa087e25b262f9609"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260906083359-337fd14/opencode-linux-x64.tar.gz"
        sha256 "6bb28f0e13f06cb5235e02437c628719458fb1ae698811678ac98fc08ef27ef9"
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
