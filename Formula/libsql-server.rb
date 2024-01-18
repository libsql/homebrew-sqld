class LibsqlServer < Formula
  version "0.22.14"
  on_macos do
    on_arm do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.14/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "b5bae5c7e74f547fac7f03cf5a182ad6b01c411d813116d2ba0d74dbe0ddd0eb"
    end
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.14/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "6fd1d01fe5b80963b27c56d066a0e069acf484a61c4afa1c3e3964d0629cd10f"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.14/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "2e431f8ef69b0dc0436f050928b8d92430bd17af5bd254d3f2ddf4e27cf2c5c5"
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
