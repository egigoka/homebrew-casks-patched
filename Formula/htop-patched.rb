class HtopPatched < Formula
  desc "Process viewer with Apple Silicon CPU frequency and temperature support"
  homepage "https://github.com/egigoka/htop"
  url "https://github.com/egigoka/htop/releases/download/3.5.3e1/htop-3.5.3e1.tar.gz"
  version "3.5.3e1"
  sha256 "2b97b1fdea6f8554ebcf076b6e97262dcab589652780acff22e6c6c48cba3a36"
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
