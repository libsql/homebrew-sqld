class Sqld < Formula
  if Hardware::CPU.type == :arm
    url "https://github.com/libsql/sqld/releases/download/v0.21.8/sqld-aarch64-apple-darwin.tar.xz"
    sha256 "2618c95b10061a41a1611a884c410987f1fc0c6d7bc8a954672c37315e977dc8"
  else
    url "https://github.com/libsql/sqld/releases/download/v0.21.8/sqld-x86_64-apple-darwin.tar.xz"
    sha256 "61072fbffabe7055cfb750352ca4df8daa2b51ca6036dc7785ebb4aaac59c22a"
  end
  version "0.21.8"

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
