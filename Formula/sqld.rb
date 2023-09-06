class Sqld < Formula
  if Hardware::CPU.type == :arm
    url "https://github.com/libsql/sqld/releases/download/v0.20.2/sqld-aarch64-apple-darwin.tar.xz"
    sha256 "d973d338616e990d99c0127b956fdfc9e881dbd0911b8bd93611b1853a016c2b"
  else
    url "https://github.com/libsql/sqld/releases/download/v0.20.2/sqld-x86_64-apple-darwin.tar.xz"
    sha256 "1d8353251d5f58728c8035de6bed364bb50262609ce9699cc3c44d494e568b93"
  end
  version "0.20.2"

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
