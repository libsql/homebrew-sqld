class Sqld < Formula
  version "0.23.3"
  on_macos do
    on_arm do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.23.3/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "65c1e8cc03914f1d5d67acda358ff9642f98618470540394d263d55f7f9e13c1"
    end
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.23.3/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "9284c0e969396a0bcf0c1bb80fd698ceb2190b5aea4e738d7813edbbd9b7965c"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.23.3/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "009fe37ed4cef908092bcecd45f0a8331b0bf09769d04c0e631b6140e91f5cca"
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
