class LibsqlServer < Formula
  if Hardware::CPU.type == :arm
    url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.7/libsql-server-aarch64-apple-darwin.tar.xz"
    sha256 "339cb6fe2b7df97bd32a3aaf35c20f02749393e216ea707b0c14adab748998e6"
  else
    url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.22.7/libsql-server-x86_64-apple-darwin.tar.xz"
    sha256 "6b6bfda2dce0fc43f13ba0c7adfcd942783cb9c876f84f440939916782063f63"
  end
  version "0.22.7"

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
