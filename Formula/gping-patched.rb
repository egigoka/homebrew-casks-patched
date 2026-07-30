class GpingPatched < Formula
  desc "Ping grapher with timeout stats and resilient ping workers"
  homepage "https://github.com/egigoka/gping"
  url "https://github.com/egigoka/gping/archive/2e3b0bc7b5960bebc06fe47ddd3489709034fb72.tar.gz"
  version "1.20.4-patched.1785427645"
  sha256 "e309f507f5e8947444e167926e4709e0ce61619db65e803ebba6da31b83b1f00"
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
