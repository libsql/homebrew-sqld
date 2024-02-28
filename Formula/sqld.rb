class Sqld < Formula
  version "0.23.4"
  on_macos do
    on_arm do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.23.4/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "1b8b01b73a14981b0073bc534cef8b67eab8d3dccfe0b4c0cad3ff34f3758a82"
    end
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.23.4/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "5fbecd8ddb4c37fc3a4bfd9a5ab89468d6c2d7cafc717997321f5b0eae610365"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.23.4/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "cc8f5a2e6f64f4cdf5e73f7ad2c50614be45806b32e55c7cdfffe59fb6014379"
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
