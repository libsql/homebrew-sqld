class Sqld < Formula
  desc "The libsql-server application"
  version "0.24.18"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.18/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "c247ffce90f7cfc9e2445caff226e6e368a4213f942d7f8ac04e00f96111a37d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.18/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "953364322c1571d8043285715a693005837281c805336139079af895e8677a1f"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.18/libsql-server-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "31afc99b6933f46290c3eea97d944432339d11eae639529b3efbc0758adbe908"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.18/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "dce96a085074f845525e6425848b1b8cd52236522c2e3611452dc8335e2cc3a1"
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
