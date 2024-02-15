class LibsqlServer < Formula
  version "0.22.22"
  on_macos do
    on_arm do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.22/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "b11bfcf35f65d0f3bf6eadc7eb4c5e9fbff503520904da7c5a9d88b1ab6d74a6"
    end
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.22/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "5e930be386c31af6181e805389cbe7890e3db5f71ed991daa7ae87b6f12813e7"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.22/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e8bd4e3f105ab41ba7632729edbd01dbd2fba3592fe99e3d309da25569b19816"
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
