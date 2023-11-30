class LibsqlServer < Formula
  if Hardware::CPU.type == :arm
    url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.8/libsql-server-aarch64-apple-darwin.tar.xz"
    sha256 "ef0e2ef00d4a2c85c6f916d8afd816c9eb66469ca7dc9a9fd5a0c75d284851c4"
  else
    url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.8/libsql-server-x86_64-apple-darwin.tar.xz"
    sha256 "261def846c04f8a6cd6dc5d921e4c48df3a5dd2d985a90cbdedfc42809adc4ff"
  end
  version "0.22.8"

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
