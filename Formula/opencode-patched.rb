class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  version "2.0.26"
  license "MIT"

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/egigoka/opencode/releases/download/v2.0.26/opencode-darwin-arm64.zip"
      sha256 "96b5e28355b34f884d9ca111b468475d5e03045e5dfa87b57021a95ec87eb8ff"
    end
    on_intel do
      url "https://github.com/egigoka/opencode/releases/download/v2.0.26/opencode-darwin-x64.zip"
      sha256 "4dfcc8c088379231e5ae0ef47f3d6efe72d7c8575698fd6c23cc21c350c5e631"
    end
  end

  on_linux do
    on_arm do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v2.0.26/opencode-linux-arm64-musl.tar.gz"
        sha256 "3a977b78ebaf4aac91060437894cf5d8f0fc781b0c6104155ef0c473d7f09160"
      else
        url "https://github.com/egigoka/opencode/releases/download/v2.0.26/opencode-linux-arm64.tar.gz"
        sha256 "e3d6771ab63c5f677c5242352f01bc7bbab17ad5ab7639d70c153de985d8cd49"
      end
    end
    on_intel do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v2.0.26/opencode-linux-x64-musl.tar.gz"
        sha256 "93a36ad1fe365e7dbf74b2ea6dda27e813e98f3427b002e4f0a2d8294c3b9b39"
      else
        url "https://github.com/egigoka/opencode/releases/download/v2.0.26/opencode-linux-x64.tar.gz"
        sha256 "098be27763db665e0317c08b9860ce71e3727f4c816a9d01adcfa82f1916e7fc"
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
