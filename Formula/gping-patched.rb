class GpingPatched < Formula
  desc "Ping grapher with timeout stats and resilient ping workers"
  homepage "https://github.com/egigoka/gping"
  url "https://github.com/egigoka/gping/archive/c5a97614c6fb6380d6b03baab5e4efc56b381f00.tar.gz"
  version "1.20.4-patched.1785427170"
  sha256 "657e04e8f1de9fda7556133a61eddf78771face872f1a648556c4c2ea3dd1085"
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
