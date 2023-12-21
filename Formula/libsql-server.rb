class LibsqlServer < Formula
  if Hardware::CPU.type == :arm
    url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.11/libsql-server-aarch64-apple-darwin.tar.xz"
    sha256 "e57fb8e0d9225f94959f027e52445d6e43dda099a87d79b2ca913a59883cde7d"
  else
    url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.11/libsql-server-x86_64-apple-darwin.tar.xz"
    sha256 "8e693a43f454bdcaa01019abc52c6efbb4392e3c9fa0a1d2b79f7502f14ee11d"
  end
  version "0.22.11"

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
