class LibsqlServer < Formula
  version "0.22.16"
  on_macos do
    on_arm do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.16/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "48c45f8501e41769d912269dca263bdab93d4c3d8e826bb6785cc76a55d32b3f"
    end
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.16/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "5c28547b6af5aafcfdec5dc053ad6ff756af537a72383794d750d4141c84b483"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.16/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "61fbea9071905d4ce1f47f78512e3ccf528f4e84104026292ba3e9cc2148fec3"
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
