class GpingPatched < Formula
  desc "Ping grapher with timeout stats and resilient ping workers"
  homepage "https://github.com/egigoka/gping"
  url "https://github.com/egigoka/gping/archive/97f1c26aa0c4c07a264b4a0009cdcefec9ebe467.tar.gz"
  version "1.20.4-patched.1785427499"
  sha256 "34c702a33b3611ad79cfe8585df7557f5e4bbbe9dd0e015430dc3a4bd47ef5b0"
  license "MIT"

  depends_on "pkgconf" => :build
  depends_on "rust" => :build

  on_linux do
    depends_on "iputils"
  end

  conflicts_with "gping", because: "both install a `gping` binary"
  conflicts_with "inetutils", because: "both install a `gping` binary"

  def install
    system "cargo", "install", *std_cargo_args(path: "gping")
    man.install "gping.1"
  end

  test do
    base_version = version.to_s.split("-").first
    assert_match "gping #{base_version}", shell_output("#{bin}/gping --version")
  end
end
