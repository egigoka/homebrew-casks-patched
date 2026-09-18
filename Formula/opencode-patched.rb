class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  version "0.0.0-daily-20260918082944-b02acc1"
  license "MIT"

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260918082944-b02acc1/opencode-darwin-arm64.zip"
      sha256 "795ddbf74f35361b12498eb9a706d5785567c763966e7edb55fd56aacd2da4ae"
    end
    on_intel do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260918082944-b02acc1/opencode-darwin-x64.zip"
      sha256 "eeeb4e09c48293bf7e8507ca649a38bf0dc1dfb7e6604f4412049787d41293a8"
    end
  end

  on_linux do
    on_arm do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260918082944-b02acc1/opencode-linux-arm64-musl.tar.gz"
        sha256 "41bcbfd9f4d8440eb78e15a6801a37d4497f0494047c3131732ea71d6966b06f"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260918082944-b02acc1/opencode-linux-arm64.tar.gz"
        sha256 "3e69e1252ba99a8dca6603202246187d2d9062451f6936968289c6435804db7e"
      end
    end
    on_intel do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260918082944-b02acc1/opencode-linux-x64-musl.tar.gz"
        sha256 "abc0946a9b220f659fce944d482b2c2f4658292c355da614125782aa559ab63b"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260918082944-b02acc1/opencode-linux-x64.tar.gz"
        sha256 "08c30a951257410c948b968b88b56e23f65f7967bcee8d71472fa59e6457754c"
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
