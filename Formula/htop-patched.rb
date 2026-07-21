class HtopPatched < Formula
  desc "Process viewer with Apple Silicon CPU frequency and temperature support"
  homepage "https://github.com/egigoka/htop"
  url "https://github.com/egigoka/htop/releases/download/3.5.2e2/htop-3.5.2e2.tar.gz"
  version "3.5.2e2"
  sha256 "965b650a6971b9c97fd3b7269aed0912a43a660c44c600067cb03f8ce277bd40"
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
    pipe_output bin/"htop", "q", 0
  end
end
