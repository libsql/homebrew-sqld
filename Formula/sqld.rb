class Sqld < Formula
  version "0.23.7"
  on_macos do
    on_arm do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.23.7/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "961cfec07978d242e9bfc90d318954ce96dc4afc774f526c9b4ee276d5a1b837"
    end
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.23.7/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "01902a0da4df648af9f02004ccb7748fffd91778a3bf4255b8a3df84688c5c6b"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.23.7/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7952ebb1df87ac7f8da583b233e6107d1a885a1b0222e565d835a697f9552448"
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
