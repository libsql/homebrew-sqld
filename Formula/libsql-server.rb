class LibsqlServer < Formula
  version "0.22.17"
  on_macos do
    on_arm do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.17/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "d78ac490f13f3892da386ddcad2ccdaa02e037873f7c6b8c281bc9201116a0ca"
    end
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.17/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "a0d6752b6f65e34ac86933515c18ee5efc83826c6d9a9e7d0cb08920143bd8ed"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.17/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0d20dc786c39ca255f35a63bc9875e6a9829806aa5381113f1e8bee895a88965"
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
