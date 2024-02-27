class Sqld < Formula
  version "0.23.1"
  on_macos do
    on_arm do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.23.1/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "73c9699b5aafebee1f0d5ab771550e82c6a602caae3f15e29cf56b0bcadad336"
    end
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.23.1/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "30dcc8313a7893f6363ceb8d1533669a641fa3aac9795fac108fc0a1c0a2f387"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.23.1/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5f083b3b66f1a0aeaef8530d4b7c1e406be50ff091f88a1a6e3c031c61363cc1"
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
