class SqldBeta < Formula
  desc "Server-mode binary for libSQL (sqld), an Open Contribution fork of SQLite"
  homepage "https://libsql.org"
  url "https://github.com/libsql/sqld/archive/refs/tags/v0.17.2.tar.gz"
  sha256 "bcbead9ab2d8f83b8d59ddcf606616c75fbc48197e3c6da863d63b4887b4db3d"
  license "MIT"

  depends_on "llvm" => :build
  depends_on "pkg-config" => :build
  depends_on "rust" => :build
  depends_on "protobuf"

  def install
    system "cargo", "install", *std_cargo_args(path: "sqld")
  end

  test do
    server_port = free_port
    fork do
      exec bin/"sqld", "--http-listen-addr", "127.0.0.1:#{server_port}"
    end
    output = shell_output \
      "curl --retry 5 --retry-all-errors --retry-delay 1 -s -d '{\"statements\": [\"SELECT * from notable;\"] }' \
      127.0.0.1:#{server_port}"
    assert_match "no such table", output
  end
end
