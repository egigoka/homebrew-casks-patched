class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  version "0.0.0-daily-20260914091541-228e909"
  license "MIT"

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260914091541-228e909/opencode-darwin-arm64.zip"
      sha256 "2a5208fc0364a2e9583d766139851bf950ea1590745b679985229f953ccd41f7"
    end
    on_intel do
      url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260914091541-228e909/opencode-darwin-x64.zip"
      sha256 "d6e889fef94fba5506a7769c24079f977741859f117d4e3a9d26274628e49608"
    end
  end

  on_linux do
    on_arm do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260914091541-228e909/opencode-linux-arm64-musl.tar.gz"
        sha256 "dee45ac1acc393c3d8fb38f1fb2497e5663d91aad0e663ba3fdd6ef8e24eddc8"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260914091541-228e909/opencode-linux-arm64.tar.gz"
        sha256 "ac676d354280fb387e6925263db980bf3155d0c10cb927c1e0127a49181b4a74"
      end
    end
    on_intel do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260914091541-228e909/opencode-linux-x64-musl.tar.gz"
        sha256 "2c9167befa981b083e587d1349e219cf030f25a905d485591ec61ed65aa9fb28"
      else
        url "https://github.com/egigoka/opencode/releases/download/v0.0.0-daily-20260914091541-228e909/opencode-linux-x64.tar.gz"
        sha256 "9b4ed348cba387316494cc5138a03004d3e062ec44c643ef9e41fcd8ebbf5c08"
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
