class Sqld < Formula
  if Hardware::CPU.type == :arm
    url "https://github.com/libsql/sqld/releases/download/v0.21.2/sqld-aarch64-apple-darwin.tar.xz"
    sha256 "3966c3ae2328942fcec196d7ddb73b3b741f0950e05ba28a42fd166e287bb570"
  else
    url "https://github.com/libsql/sqld/releases/download/v0.21.2/sqld-x86_64-apple-darwin.tar.xz"
    sha256 "6df2fb55c04ec71c1b809d69d10c7a780172c55fdd5d227a73f188957b1dd97a"
  end
  version "0.21.2"

  def install
    bin.install "sqld"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
