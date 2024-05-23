class Sqld < Formula
  desc "The libsql-server application"
  version "0.24.11"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.11/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "5e1d8a9db6189ebbf61b6bdc6da496ee8f4f16045e6e4e7183aaa7e8e5ae2857"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.11/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "28cf33e47aea472756547bd0872ec3f748535597ad476a9a93e32604d4ca3012"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.11/libsql-server-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "ac537c25166cf9da5d02b7a265e2c2f2c4f989664b6e5b3a46dab79804d3e65a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.11/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f95a04a77bd42f1a60e98a02b9d5af021810009141e6ba1f0547752b49923368"
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
