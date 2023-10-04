class Sqld < Formula
  if Hardware::CPU.type == :arm
    url "https://github.com/libsql/sqld/releases/download/v0.21.6/sqld-aarch64-apple-darwin.tar.xz"
    sha256 "fdb68546142c94cf8ff3d499a14c02c5d8e20d3d389a565ae2ee521ba3711785"
  else
    url "https://github.com/libsql/sqld/releases/download/v0.21.6/sqld-x86_64-apple-darwin.tar.xz"
    sha256 "2ade81b93c0651aa3f9c36e5f3d5a4f1b3b07bd744a66164bf6b37f90d99c2ed"
  end
  version "0.21.6"

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
