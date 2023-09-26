class Sqld < Formula
  if Hardware::CPU.type == :arm
    url "https://github.com/libsql/sqld/releases/download/v0.21.1/sqld-aarch64-apple-darwin.tar.xz"
    sha256 "025be46a62f9abe108c57e78c05e2780b653b9ef82f2659fd7140bdf7e6c09b7"
  else
    url "https://github.com/libsql/sqld/releases/download/v0.21.1/sqld-x86_64-apple-darwin.tar.xz"
    sha256 "c34dc1fe69c63638f61f30ed519ba2ec2287ea01c4a46681da578707eafa33f1"
  end
  version "0.21.1"

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
