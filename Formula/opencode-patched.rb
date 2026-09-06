class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  version "0.0.0-daily-20260906075622-242e754"
  license "MIT"

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260906075622-242e754/opencode-darwin-arm64.zip"
      sha256 "5a0a79eb6f6712026b336329abd36c6c0d359a3714fa716958a43fc416c42b84"
    end
    on_intel do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260906075622-242e754/opencode-darwin-x64.zip"
      sha256 "f7d256d7a34e6ab1a10905a4199ca68a3fdd8a50d4737bd9c6d42d3a320358f3"
    end
  end

  on_linux do
    on_arm do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260906075622-242e754/opencode-linux-arm64-musl.tar.gz"
        sha256 "b61c4e7185eec0a06502c20849590a45cec1e05b95ead169c215cb4aa925c152"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260906075622-242e754/opencode-linux-arm64.tar.gz"
        sha256 "586b697f110f56ad7ba7528313b664c45338c15aafa8d876c2c53bac0b245c98"
      end
    end
    on_intel do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260906075622-242e754/opencode-linux-x64-musl.tar.gz"
        sha256 "3994c26bb97df612ea0fc248d0da82aa9a8214db7e3678e7244691b06d90d9fe"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260906075622-242e754/opencode-linux-x64.tar.gz"
        sha256 "40e68079ff1b176319e446d12e50a060e152314dc0844e37b9f3a8c0a1b296f7"
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
