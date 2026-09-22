class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  version "1.18.32-e"
  license "MIT"

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/egigoka/opencode/releases/download/v1.18.32-e/opencode-darwin-arm64.zip"
      sha256 "728fd193e416a37bd59b9f8b054e69739eaf9776874bae3e0954507f36853232"
    end
    on_intel do
      url "https://github.com/egigoka/opencode/releases/download/v1.18.32-e/opencode-darwin-x64.zip"
      sha256 "4c3f6c8f36aeb450e815f684846df5fdc297b5ef1658ca80eddf5614a0d14cb0"
    end
  end

  on_linux do
    on_arm do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v1.18.32-e/opencode-linux-arm64-musl.tar.gz"
        sha256 "26f60c9b755323524a1b13bc35e648d995e8a809b94af9fd795b7801a652953f"
      else
        url "https://github.com/egigoka/opencode/releases/download/v1.18.32-e/opencode-linux-arm64.tar.gz"
        sha256 "b357f700e00d8e789930e9150a6b2fc9270421e42e6bf0365e1ad3e9d447f484"
      end
    end
    on_intel do
      if File.exist?("/etc/alpine-release")
        url "https://github.com/egigoka/opencode/releases/download/v1.18.32-e/opencode-linux-x64-musl.tar.gz"
        sha256 "0a4f1b1f599d342cbf4458bb4703b68a63cefa5cdc1dd7c12e3fac26334c473f"
      else
        url "https://github.com/egigoka/opencode/releases/download/v1.18.32-e/opencode-linux-x64.tar.gz"
        sha256 "1f0ba4bfe1e59a84328b5c716f9cd62473476588c1b2491decfb6a93e971693c"
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
