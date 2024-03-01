class Sqld < Formula
  version "0.23.5"
  on_macos do
    on_arm do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.23.5/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "3300bf7b6b6c8cc488cea85649dd7129fb118a661b6a06a759f9f33b8231cff1"
    end
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.23.5/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "f5c15da39fa238a4785f08af0602d8a0f11d5f5be733d195fcdec86d54aa8fbb"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.23.5/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "2c7d8bc69897b19cc5009af430203e89021a72ff937b217311522fb81b574e12"
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
