class Sqld < Formula
  if Hardware::CPU.type == :arm
    url "https://github.com/libsql/sqld/releases/download/v0.20.3/sqld-aarch64-apple-darwin.tar.xz"
    sha256 "b57e87c72632fded07c60f44613518645a2ea9ef5453ee84d3fab8ca2ac521ca"
  else
    url "https://github.com/libsql/sqld/releases/download/v0.20.3/sqld-x86_64-apple-darwin.tar.xz"
    sha256 "90a40d7439c379d1f2005b77228f5fcd35d1c80fb9f9db9a907b05cc4b2581aa"
  end
  version "0.20.3"

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
