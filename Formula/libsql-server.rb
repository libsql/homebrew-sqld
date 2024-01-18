class LibsqlServer < Formula
  version "0.22.13"
  on_macos do
    on_arm do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.13/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "d4d0aaff3a7dbf5ec2a7aad911066bc5bfa3371571a8b85bfccbf48ffc820785"
    end
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.13/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "86e8678a88a30a46ef655a662e35af8717ae5c5a038f785323b75fc9ae6f6c66"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.13/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "76fd6e33c087beb1e2930dcbd4334511aea3991f2bdddfdc91e4c8e590d80d8f"
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
