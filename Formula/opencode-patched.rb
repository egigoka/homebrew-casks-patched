class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  version "0.0.0-daily-20260911081832-193de13"
  license "MIT"

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260911081832-193de13/opencode-darwin-arm64.zip"
      sha256 "7bc85db9bda6112aab761b7c8d29ca85f4ad5a0feca50cd60eb24a75332705ee"
    end
    on_intel do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260911081832-193de13/opencode-darwin-x64.zip"
      sha256 "d8756b0913e25c3086ccce8fdf62b143b1d697ae8bcc1eab9aee8f4a1afa4187"
    end
  end

  on_linux do
    on_arm do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260911081832-193de13/opencode-linux-arm64-musl.tar.gz"
        sha256 "bd2ed26c7ef3a38f1fdc5713168d5e25c67abf3480c049c37004ae7887c10e13"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260911081832-193de13/opencode-linux-arm64.tar.gz"
        sha256 "6c70a7145debda168e462119665bc5702f1ddd0ccd5b25a58e227f7c53495df7"
      end
    end
    on_intel do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260911081832-193de13/opencode-linux-x64-musl.tar.gz"
        sha256 "1e48f5c0b1c5fa79da25c039c69916502aaec60d591d7a45d2ee492d483af689"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260911081832-193de13/opencode-linux-x64.tar.gz"
        sha256 "25f4e11b5b2958780712cf0f1500dea53a78fcaa3826598307fd3e1af65b614c"
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
