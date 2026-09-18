class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  version "1.18.31-e"
  license "MIT"

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/egigoka/opencode/releases/download/v1.18.31-e/opencode-darwin-arm64.zip"
      sha256 "33a0e7b080b193b8cf60d964c43eedcbe5edc23b5ea5a2ca66b801cfc769a314"
    end
    on_intel do
      url "https://github.com/egigoka/opencode/releases/download/v1.18.31-e/opencode-darwin-x64.zip"
      sha256 "2a7ce24e731d2a223e5d948f2dcaa05dcb03c5450860e2b74605b6def4e62cd2"
    end
  end

  on_linux do
    on_arm do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v1.18.31-e/opencode-linux-arm64-musl.tar.gz"
        sha256 "babfc93d92fcbe3ed6370a62a8ef2986d4ad99f4251944798b99a92c7d961cca"
      else
        url "https://github.com/egigoka/opencode/releases/download/v1.18.31-e/opencode-linux-arm64.tar.gz"
        sha256 "362a230b8456da66154381ad65e9fe4518af8459eec7276384f6433928b2cca2"
      end
    end
    on_intel do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v1.18.31-e/opencode-linux-x64-musl.tar.gz"
        sha256 "bec55be7dd483376d11ead84f5c351deb15a818109cf7b6a02cef08cd22f8b93"
      else
        url "https://github.com/egigoka/opencode/releases/download/v1.18.31-e/opencode-linux-x64.tar.gz"
        sha256 "38f480173c6118576c5989becde53137ddd2e0a2e7ab9ec5465a55ab7f1d949a"
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
