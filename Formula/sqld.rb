class Sqld < Formula
  if Hardware::CPU.type == :arm
    url "https://github.com/libsql/sqld/releases/download/v0.21.3/sqld-aarch64-apple-darwin.tar.xz"
    sha256 "dcd387b7e4fff5f30d73d63e564880c19b58d98b50d03fbd89d3bf2153f341c5"
  else
    url "https://github.com/libsql/sqld/releases/download/v0.21.3/sqld-x86_64-apple-darwin.tar.xz"
    sha256 "504318e28d3d028096223032301b97bab0cf9929e6eba84704e8f80a2a839496"
  end
  version "0.21.3"

  def install
    bin.install "sqld"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
