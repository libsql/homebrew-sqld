class Sqld < Formula
  desc "The libsql-server application"
  homepage "https://github.com/tursodatabase/libsql"
  version "0.24.22"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.22/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "fb843985d2a8e270ab0eea6e42506cd726d2b09c014c710fc285c27a5d9f0749"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.22/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "2ca2ad6a0ff55a2e9c336889dba0a386439fafd7b41643d32982441e2fb2e07c"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.22/libsql-server-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "e44f8cd636efdd736a988f1817f06f7f633c9c167b11efebcdb6a7544f004a37"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.22/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ba3c9877d20e198236c193b0b389009f8705d4df5d4feff23ad4f7f8b91710ad"
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
