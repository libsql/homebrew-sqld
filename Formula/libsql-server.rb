class LibsqlServer < Formula
  version "0.22.12"
  on_macos do
    on_arm do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.12/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "c05f18cbd57830ad46828959cd924253f3e3005ad85ac630c48643f70ac75a14"
    end
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.12/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "085bb5ae13fe50e1e6922ddf3d6622457213a5e98644c2c474d9605945108c21"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.12/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "20e1996fdfa328c4f3e95a8aaa62f4efc6c56d530c6eb20ff0d55db9bbe40bc0"
    end
  end

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
