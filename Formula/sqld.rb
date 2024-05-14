class Sqld < Formula
  desc "The libsql-server application"
  version "0.24.8"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.8/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "416ffae12effc993a1072d55c45986f0e1252b75a79cffb8740b2a71fc5e7779"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.8/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "d32743e50ecb905667cea5ef0e51c0bc84126eface2a26a1d21e2775af9879d5"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.8/libsql-server-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "0325dcb9ac8e82ead712fee0d188a492fefb4809efb1834b9c04a45bb168cdae"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.8/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "1122a8b682647611993dd1c9c1fd09f9f955a127cb485a1028ef8bf7d6a7ccd1"
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
