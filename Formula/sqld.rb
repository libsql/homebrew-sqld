class Sqld < Formula
  if Hardware::CPU.type == :arm
    url "https://github.com/libsql/sqld/releases/download/v0.21.7/sqld-aarch64-apple-darwin.tar.xz"
    sha256 "9533e865024a928525b19cd32c12fe54e31bb17cd384c11fe9f0b1f73f41d0c0"
  else
    url "https://github.com/libsql/sqld/releases/download/v0.21.7/sqld-x86_64-apple-darwin.tar.xz"
    sha256 "6910e49dc9cc62547722f7712f7cda746e34d8fd954fbecfaac9cb71273b8c2e"
  end
  version "0.21.7"

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
