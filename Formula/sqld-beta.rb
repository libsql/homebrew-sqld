class SqldBeta < Formula
  desc "SQLd is the server-mode binary for libSQL, an Open Contribution fork of SQLite"
  homepage "https://libsql.org"
  # pull from git tag to get submodules
  url "https://github.com/libsql/sqld.git",
      tag:      "v0.4.0"
  license "MIT"

  depends_on "rust" => :build
  depends_on "protobuf"

  def install
    ENV.append "SQLITE3_STATIC", "1"
    cd "sqld" do
        system "cargo", "install", *std_cargo_args
    end
  end

  test do
      server_port = free_port
      server_pid = fork { exec bin/"sqld", "--http-listen-addr", "127.0.0.1:#{server_port}" }
      output = shell_output "curl --retry 5 -s -d '{\"statements\": [\"SELECT * from notable;\"] }' 127.0.0.1:#{server_port}"
      assert_match "no such table", output 
  ensure
    Process.kill "SIGTERM", server_pid
  end
end
