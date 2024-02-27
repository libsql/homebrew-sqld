class Sqld < Formula
  version "0.23.2"
  on_macos do
    on_arm do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.23.2/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "5e9a96cbc93ff3f91cb5e1563864071e97912174ce9de67dd27a4a72cd03ee35"
    end
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.23.2/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "b85d9348cb414fcaa87e91a6362690158e9afb6cf9abb47886c98be59780092c"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.23.2/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "aba518b23b7357d6bfc64f108b7bc15d902e8932738b9b065c43cf7208bfe28e"
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
