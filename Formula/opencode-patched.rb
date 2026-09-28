class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  version "1.18.33-e"
  license "MIT"

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/egigoka/opencode/releases/download/v1.18.33-e/opencode-darwin-arm64.zip"
      sha256 "0d8dbb245cb52a9196be79c07bd53c0e32b3c1ca0b57686680ebd4c0ef75b91e"
    end
    on_intel do
      url "https://github.com/egigoka/opencode/releases/download/v1.18.33-e/opencode-darwin-x64.zip"
      sha256 "c5206d72df2ed53ddcc80fddcbe8f0506a184ac35095c01895cfe70737883c95"
    end
  end

  on_linux do
    on_arm do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v1.18.33-e/opencode-linux-arm64-musl.tar.gz"
        sha256 "4cac64c90bf71e29a9ded4f1a79872d99d8bd6cb23eaab659f45b33116f8a0e8"
      else
        url "https://github.com/egigoka/opencode/releases/download/v1.18.33-e/opencode-linux-arm64.tar.gz"
        sha256 "e3c818d413d6cba04fc4f11e27bc8cab2a310c77ddc439b09a1a0f10470a8824"
      end
    end
    on_intel do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v1.18.33-e/opencode-linux-x64-musl.tar.gz"
        sha256 "8ea3163b3a10eed7a8e1b8abf41cd64f245dcd16824a5b593d413a5bcafa1c48"
      else
        url "https://github.com/egigoka/opencode/releases/download/v1.18.33-e/opencode-linux-x64.tar.gz"
        sha256 "9d94f14538f7cb77e8f8caac72b68f462cf95b41bb625f733fc1d6ce782962f4"
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
