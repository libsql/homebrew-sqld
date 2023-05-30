class SqldBeta < Formula
  desc "Server-mode binary for libSQL (sqld), an Open Contribution fork of SQLite"
  homepage "https://libsql.org"
  url "https://github.com/libsql/sqld/archive/refs/tags/v0.15.0.tar.gz"
  sha256 "f91b186be68742b5927678d94c35830b963fa972429d10cd4ffaf722e7e56b69"
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
