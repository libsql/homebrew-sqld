class Sqld < Formula
  desc "The libsql-server application"
  version "0.24.17"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.17/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "f7df62883266faca6b8a08350fd22af9d997cea6087474bc2638438160fbc341"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.17/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "bf0496e98d631c819044bb7c866b46133fcf9085d52cdd21cca4beb93912e42c"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.17/libsql-server-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "0d78facc62e03f75280bd3ecbb3eaeeb375f58af48b106495d5095271c578b5f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.17/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5b4ebe4d68b7f3405463ad9f8c2ef3bff0a1bee318efb5c9f47239857b2be974"
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
