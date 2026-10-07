class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  version "1.18.35"
  license "MIT"

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/egigoka/opencode/releases/download/v1.18.35/opencode-darwin-arm64.zip"
      sha256 "7ad2e9336ef60a7526c3e1a930dce971aabe643b4ec37e93adf7184228818040"
    end
    on_intel do
      url "https://github.com/egigoka/opencode/releases/download/v1.18.35/opencode-darwin-x64.zip"
      sha256 "beac8156a0126fde33935640fedde8d76a9778dcde0e79b93b6d6ce284fe22ff"
    end
  end

  on_linux do
    on_arm do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v1.18.35/opencode-linux-arm64-musl.tar.gz"
        sha256 "a5b2f7148084cfece54a3e462588a010c43ab988a5b08df169b8cc50e12bc615"
      else
        url "https://github.com/egigoka/opencode/releases/download/v1.18.35/opencode-linux-arm64.tar.gz"
        sha256 "02a63e131715eab3b591a750117a0bf848c3cae9a3a0173a6ea31eef810aec9a"
      end
    end
    on_intel do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v1.18.35/opencode-linux-x64-musl.tar.gz"
        sha256 "56c32c005fec9d7701f8c7f6bcc21bad9ae2d4f8905f30eba93c372046eadc23"
      else
        url "https://github.com/egigoka/opencode/releases/download/v1.18.35/opencode-linux-x64.tar.gz"
        sha256 "df366c80efee7d50b85a478420e2ff0c7aec3c8c28b1dbe4e47181f2e583e0a6"
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
