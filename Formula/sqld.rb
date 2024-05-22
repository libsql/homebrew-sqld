class Sqld < Formula
  desc "The libsql-server application"
  version "0.24.10"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.10/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "6276c5c92a31094c64c32266f076b6499a1acce5e6d198ca8e715c77d5ade171"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.10/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "aec1bf94d3a37e2dd0dffce4c90a2631c2d1879e34fb94b8d0b0be1713a5b199"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.10/libsql-server-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "fc1dac6c7f8c0db3a4ce71ea297e7e6b137afdc60e66853491a566a6f724dc28"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.10/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ef378c695347b89486ed540614c07e5ba43a614aebd3d7bd5a03ed112a87e375"
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
