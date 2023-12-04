class LibsqlServer < Formula
  if Hardware::CPU.type == :arm
    url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.10/libsql-server-aarch64-apple-darwin.tar.xz"
    sha256 "7840adc50ded71720a1355f44af8a2400a1277d9e7d3da6503e8a53f09f7bfb7"
  else
    url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.10/libsql-server-x86_64-apple-darwin.tar.xz"
    sha256 "3c47baa1890018411e8c2112981991f93249cf78437539fe36535232150d9b44"
  end
  version "0.22.10"

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
