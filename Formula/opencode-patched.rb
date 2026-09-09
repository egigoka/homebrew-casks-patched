class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  version "0.0.0-daily-20260909082305-830d5eb"
  license "MIT"

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260909082305-830d5eb/opencode-darwin-arm64.zip"
      sha256 "4cf2fbc5c985e7b833013c05cf2287d38217fd0bdbd7610b208ce135773ab977"
    end
    on_intel do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260909082305-830d5eb/opencode-darwin-x64.zip"
      sha256 "de346fc9c540cdb095b3051e16bad2f2a2470567ae82724e590bd6b8544321a3"
    end
  end

  on_linux do
    on_arm do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260909082305-830d5eb/opencode-linux-arm64-musl.tar.gz"
        sha256 "a32ba6cb55771d9ba61da9d3568207695894142f3639a77580b914da162fcb77"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260909082305-830d5eb/opencode-linux-arm64.tar.gz"
        sha256 "bdfa4618ff038539e7c8e73d5dbb09f97162af485a0adbcb8addc29518d41896"
      end
    end
    on_intel do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260909082305-830d5eb/opencode-linux-x64-musl.tar.gz"
        sha256 "9361b6de92c12ab21d0004aba2c9c4652d43e7c9b28c1982f975b9fd571a508c"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260909082305-830d5eb/opencode-linux-x64.tar.gz"
        sha256 "0fc6cbbf02e1d402aecc89c08b6e4834080bd406812080d2790e3f35c6a3b19e"
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
