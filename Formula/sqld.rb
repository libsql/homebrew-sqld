class Sqld < Formula
  if Hardware::CPU.type == :arm
    url "https://github.com/libsql/sqld/releases/download/v0.20.0/sqld-aarch64-apple-darwin.tar.xz"
    sha256 "64dfcf1f673c03a8310c199c5c05a6260f39e3eda4be667fad3e2cd9995fdfb6"
  else
    url "https://github.com/libsql/sqld/releases/download/v0.20.0/sqld-x86_64-apple-darwin.tar.xz"
    sha256 "502dac4d36b8d8984c0e9a4a93b0648d07eb33c29c81f7e2b0784d0f9b690d01"
  end
  version "0.20.0"

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
