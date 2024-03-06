class Sqld < Formula
  version "0.23.6"
  on_macos do
    on_arm do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.23.6/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "30e5b8290afcc0b40c31945a1e80c1bc08556a02b42abd5951b7861a7f4251a0"
    end
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.23.6/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "9813bd1a8178ec2508ac1e28298081e5ea9585a392624865416a069b0de0fa83"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.23.6/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "fd74630381395e7e3f914ea8141eea8defc2d468c7e2f9630dadcd298abcc4f5"
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
