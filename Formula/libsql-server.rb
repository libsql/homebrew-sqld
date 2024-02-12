class LibsqlServer < Formula
  version "0.22.18"
  on_macos do
    on_arm do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.18/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "a550c70c0fe5c3656b5004971bcdbc38fd223f3664d0eaa398499b3e00bd965b"
    end
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.18/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "5fb6decd82674a1ce5ae13fc76419e160359d2da5e63cc762360046cc7bb77d0"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.18/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "11575f7aac6b551cf00f40af638a99f5e8171d398e1d3f4506b40e61c20c556e"
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
