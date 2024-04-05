class Sqld < Formula
  version "0.24.5"
  on_macos do
    on_arm do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.5/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "257ebfbad274bc51268b24d4a46257bb623becc93621ef41072b181a7a4ccef4"
    end
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.5/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "31b3d1445f35e923f447f813b278d52ba088e55b950eb8e76655d22a1ec718ee"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.5/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "eeb5fef39530ae1ec53539a6d3e427040ae8215c0d31fedbce39019215b7ee98"
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
