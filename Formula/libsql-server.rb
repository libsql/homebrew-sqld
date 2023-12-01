class LibsqlServer < Formula
  if Hardware::CPU.type == :arm
    url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.9/libsql-server-aarch64-apple-darwin.tar.xz"
    sha256 "426cf829a9bbf3ef6ca9ef49099b5d09da16cf2f55a3961d1534a90a0d3cb87d"
  else
    url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.9/libsql-server-x86_64-apple-darwin.tar.xz"
    sha256 "272efeb075c19924e419376714857444b5cd0230d00fc9b655daac504bc74797"
  end
  version "0.22.9"

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
