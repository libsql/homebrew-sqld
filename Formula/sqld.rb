class Sqld < Formula
  desc "The libsql-server application"
  homepage "https://github.com/tursodatabase/libsql"
  version "0.24.27"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.27/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "adfde43bc8f51eca9ac0bcb5a7d0cee6a7c55f72d14792b008c93bc5755de106"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.27/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "57c4c3087bc8d16866cbd213caffda2dbc419f5451dc27f01a6f417c1d1a0725"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.27/libsql-server-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "54c427d4b3f680f243e3563f65fedc3212e60f800240565d5fedbdb23673e031"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.27/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "06878e65ce8e72587aa331bda6e0ea7d647b33315335d23cd42391707553a31c"
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
