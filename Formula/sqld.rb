class Sqld < Formula
  if Hardware::CPU.type == :arm
    url "https://github.com/libsql/sqld/releases/download/v0.21.4/sqld-aarch64-apple-darwin.tar.xz"
    sha256 "00adba29e420914cd200cd515432ac79dc7031d3c94dd5dd19ab383581c64791"
  else
    url "https://github.com/libsql/sqld/releases/download/v0.21.4/sqld-x86_64-apple-darwin.tar.xz"
    sha256 "08f7d8e9d3419050544291029122d74623a832b55b2e67ef9cc239ec868ece17"
  end
  version "0.21.4"

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
