class LibsqlServer < Formula
  version "0.22.15"
  on_macos do
    on_arm do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.15/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "d9dcfa1ca21f8df7e29c90160cbbd69f42c811bca3b543b4ce5a1857b0023453"
    end
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.15/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "348b7207e0ad4f8e818c079ef29d3db96d0574ed2f1bfe08843cb0ec6dda26e1"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.15/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "1b23c598d5d8a0601e1a6496e815f07e33a72ee7e3bb8c3a1ecbe32f219bb4a5"
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
