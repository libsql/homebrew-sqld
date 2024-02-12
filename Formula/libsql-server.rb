class LibsqlServer < Formula
  version "0.22.19"
  on_macos do
    on_arm do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.19/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "b5e7d88f19476d569030414baf852eaf26ee5af47aa4fbda60cde7ff359b87c0"
    end
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.19/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "e103bd1d244858c9d8035ce443e621254b4eaa64b757a494245c08958dfb58e4"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.19/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "745d2688053eecb2b52e5bab1961fbb33d584e77eded1827f936bac200c40ad9"
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
