class LibsqlServer < Formula
  version "0.22.21"
  on_macos do
    on_arm do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.21/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "a10efa833d4ff9589cb0bbb4a6f92476ac3a0aab5aec675afbd6d700560e16a7"
    end
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.21/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "2d9ce99ef50006fafb2948b04571e396301a82a33f28fd204a45f93eb9aab816"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.21/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "3bb13107cb2cd0b5ebea8d0d052afc2e0242423222b36317f124c3bf1c69f8cb"
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
