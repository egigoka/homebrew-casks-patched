class HtopPatched < Formula
  desc "Interactive process viewer with Apple Silicon CPU frequency support"
  homepage "https://github.com/egigoka/htop"
  url "https://github.com/egigoka/htop/releases/download/3.5.2e1/htop-3.5.2e1.tar.gz"
  version "3.5.2e1"
  sha256 "1ebc9b490c97a966877efa0a9e0c2d38a774b7c872375ece897f97e2e2c777d1"
  license "GPL-2.0-or-later"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkgconf" => :build
  depends_on :macos
  depends_on "ncurses"

  conflicts_with "htop", because: "both install an htop binary"

  def install
    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/htop --version")
    assert_equal 0, pipe_output(bin/"htop", "q", 0)
  end
end
