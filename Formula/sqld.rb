class Sqld < Formula
  desc "The libsql-server application"
  homepage "https://github.com/tursodatabase/libsql"
  version "0.24.29"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.29/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "3a0ff9003a32bd8734fce964cca9500894868d288f6f3ad65c609d7d55fa12a2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.29/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "4470271d9d8262366f8859f08f9b75561e491ce5962de1a1f84995f5118ed4c0"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.29/libsql-server-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "a6763f7258e989ecb36913675b8f459698ea2b67298b5751f86d8d1fddc1880a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.29/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a305c66d5ed2ce5ce2e748d2edf327c7707b74bb6d97393ea86f406ec450c7ae"
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
