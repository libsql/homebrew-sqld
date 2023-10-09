class Sqld < Formula
  if Hardware::CPU.type == :arm
    url "https://github.com/libsql/sqld/releases/download/v0.21.9/sqld-aarch64-apple-darwin.tar.xz"
    sha256 "ccf2057875b7c523398ee8b8bb51ce10589ca848e81f1f95a7819641574daf0e"
  else
    url "https://github.com/libsql/sqld/releases/download/v0.21.9/sqld-x86_64-apple-darwin.tar.xz"
    sha256 "2d1231bc3c0652de060968ee60c58aa58a972447ccd54c9eae4a14724100605a"
  end
  version "0.21.9"

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
