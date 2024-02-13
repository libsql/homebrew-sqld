class LibsqlServer < Formula
  version "0.22.20"
  on_macos do
    on_arm do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.20/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "f1bcc93fad1d6d10414d1a32ac4146150d5a4b995f80fdad16605df0c796039f"
    end
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.20/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "9ee76c1ec5089698baba0b8f76f07cb1621a9d34605c65afe810f7be5b475b4f"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.20/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "1f6d2650f590a796a301c51d2a362348d56650bde27934572c73f0ce1d9e7f3d"
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
