class OpencodePatched < Formula
  desc "AI coding agent for the terminal"
  homepage "https://github.com/egigoka/opencode"
  url "https://github.com/egigoka/opencode/archive/3d5e06e1916c916dbd08a79e84d8512d96fe0529.tar.gz"
  version "1.18.8-patched.1788617887"
  sha256 "4c91da6f3894aebf8fe15421f56fb4d9c29bed80dcc069860be2dd2e3d33bf79"
  license "MIT"

  depends_on "bun" => :build
  depends_on "ripgrep"

  conflicts_with "opencode", because: "both install an `opencode` binary"

  def install
    # Source archives do not include .git, which the build metadata otherwise requires.
    ENV["OPENCODE_CHANNEL"] = "dev"
    ENV["OPENCODE_VERSION"] = version.to_s.split("-").first

    system "bun", "install", "--frozen-lockfile"

    if OS.mac?
      # Bun's compiled macOS artifact needs an ad hoc signature before execution.
      inreplace "packages/opencode/script/build.ts",
        "console.log(`Running smoke test: ${binaryPath} --version`)",
        [
          "if (process.platform === \"darwin\") await $`codesign --force --sign - ${binaryPath}`",
          "    console.log(`Running smoke test: ${binaryPath} --version`)",
        ].join("\n")
    end

    system "bun", "run", "--cwd", "packages/opencode", "build", "--single", "--skip-embed-web-ui"

    arch = Hardware::CPU.arm? ? "arm64" : "x64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "packages/opencode/dist/opencode-#{os}-#{arch}/bin/opencode"
  end

  test do
    assert_match version.to_s.split("-").first, shell_output("#{bin}/opencode --version")
  end
end
