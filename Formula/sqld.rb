class Sqld < Formula
  if Hardware::CPU.type == :arm
    url "https://github.com/libsql/sqld/releases/download/v0.20.1/sqld-aarch64-apple-darwin.tar.xz"
    sha256 "54568314e7a3fa3fa78d5cdf4336ae6df8880a38e1aaf3051a73212bcfaaebe3"
  else
    url "https://github.com/libsql/sqld/releases/download/v0.20.1/sqld-x86_64-apple-darwin.tar.xz"
    sha256 "82fb9e787df447a3adfb6a429560ace995138406270d965b4319a9d5781b89bc"
  end
  version "0.20.1"

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
