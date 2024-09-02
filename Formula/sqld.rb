class Sqld < Formula
  desc "The libsql-server application"
  homepage "https://github.com/tursodatabase/libsql"
  version "0.24.23"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.23/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "8dc2ef7dfbacfb45e085d976ea3382bcd8d60ac14f536b279823353c3b17c370"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.23/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "f43d3ea14b516a4e6ee7e1a87a33425fd93e04976991c5c1009f54ec1ba1a26a"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.23/libsql-server-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "0652233df171b6998251df28cb89db6a704c8d51636cbe63bf5a04bf50f23d30"
    end
    if Hardware::CPU.intel?
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.23/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "83b26b717dcc292d7bd163357fc4b2fdcf28a753a32db16a78637b9fccac4a91"
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
