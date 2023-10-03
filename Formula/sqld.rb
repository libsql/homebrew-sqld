class Sqld < Formula
  if Hardware::CPU.type == :arm
    url "https://github.com/libsql/sqld/releases/download/v0.21.5/sqld-aarch64-apple-darwin.tar.xz"
    sha256 "052a8da9ed0536a552489fd93ece32499867858a0f85429eb3c53b702c9cb7c2"
  else
    url "https://github.com/libsql/sqld/releases/download/v0.21.5/sqld-x86_64-apple-darwin.tar.xz"
    sha256 "e0c81421968f82b0cff351835088b1af6652e2f9708340536c2a60afbe8f71ac"
  end
  version "0.21.5"

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
