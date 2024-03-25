class Sqld < Formula
  version "0.24.4"
  on_macos do
    on_arm do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.4/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "6a497bd818566293e109ca533224d38b46679ca4ce77af47b3cafbb3d08c274c"
    end
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.4/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "0f2557444e14eda6a72fa4dbaf9dcb6343443b1257ebb9b23e397ce7857cc2a2"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.4/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "1520c9944f0a9e8f9f6397a891ac485b21dde5cefe731e047885c3c99cea90ae"
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
