class LibsqlServer < Formula
  version "0.23.0"
  on_macos do
    on_arm do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.23.0/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "7e71123e801c32a4e6a961565682409054f6dec3f710e9759fc95f49b642b6d9"
    end
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.23.0/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "08a9b96ff670c7b31b2bd641756d67f8b2bd3f57c5061986f7143e458599a463"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.23.0/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "72d825d635d871cc6ee81615cefa79b1cc08facc9eb174745972a399d84a5570"
    end
  end

  def install
    on_macos do
      on_arm do
        bin.install "sqld"
      end
    end
    on_macos do
      on_intel do
        bin.install "sqld"
      end
    end
    on_linux do
      on_intel do
        bin.install "sqld"
      end
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
