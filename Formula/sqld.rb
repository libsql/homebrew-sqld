class Sqld < Formula
  if Hardware::CPU.type == :arm
    url "https://github.com/libsql/sqld/releases/download/v0.21.0/sqld-aarch64-apple-darwin.tar.xz"
    sha256 "e94fc9cc8a52bac372d5d1ab633e274b0411c2dfb36a66f1496d5ec84dc1b325"
  else
    url "https://github.com/libsql/sqld/releases/download/v0.21.0/sqld-x86_64-apple-darwin.tar.xz"
    sha256 "077912404dd9e80f15b737008ed53b83e694afc94c5a68914a87d1aea5da2263"
  end
  version "0.21.0"

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
