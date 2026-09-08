class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  version "0.0.0-daily-20260908082014-d6855b6"
  license "MIT"

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260908082014-d6855b6/opencode-darwin-arm64.zip"
      sha256 "e2f5c7ea7766291d497e28b956f757a8105295f72ec1a3ff7eee1aa2e618f48f"
    end
    on_intel do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260908082014-d6855b6/opencode-darwin-x64.zip"
      sha256 "0260b4e8caa120be2ca49b70bf401f421212dea2392aed736bc7b04d68658f79"
    end
  end

  on_linux do
    on_arm do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260908082014-d6855b6/opencode-linux-arm64-musl.tar.gz"
        sha256 "9d1e63c05b6bb5bffce4d523b74ad7cd91b6945ddeffac6acfc99e3ac2363189"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260908082014-d6855b6/opencode-linux-arm64.tar.gz"
        sha256 "1828624192d7aad782130c09d39fed1589aa641bfa2f33ec67d1eada8decbe22"
      end
    end
    on_intel do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260908082014-d6855b6/opencode-linux-x64-musl.tar.gz"
        sha256 "494bf4ed69f7e52d2b8d16ce089b127d658e5bab37ec2fd116eeb830599c1d96"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260908082014-d6855b6/opencode-linux-x64.tar.gz"
        sha256 "25779cb2fedb4d6f8712fd1869007f11f5d07f6fe9bc8e273324b697c330dcc6"
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
