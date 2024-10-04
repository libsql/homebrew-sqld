class Sqld < Formula
  desc "The libsql-server application"
  homepage "https://github.com/tursodatabase/libsql"
  version "0.24.26"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.26/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "8b9421910d24b2500bc3833a0fbc95b2011525efed920cd26f2988992bdc27fa"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.26/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "7cf4f73b03ff5920788daa78e1a4a7350fcf90ed6b4b1c6454bd9e0fdb7b7783"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.26/libsql-server-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "edc1dd5f728278aa271773bfef5fb9a374aa2d565c7f1231e4362d95d41c8aaa"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.26/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "393b4ee51b33f34657ff56f9cd69d8836c9a8e4876dbcf2bdb006d815bfb2be1"
    end
  end

  BINARY_ALIASES = {"aarch64-apple-darwin": {}, "aarch64-unknown-linux-gnu": {}, "x86_64-apple-darwin": {}, "x86_64-unknown-linux-gnu": {}}

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "sqld"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "sqld"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "sqld"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "sqld"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
