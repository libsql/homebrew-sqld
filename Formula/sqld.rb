class Sqld < Formula
  version "0.24.2"
  on_macos do
    on_arm do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.2/libsql-server-aarch64-apple-darwin.tar.xz"
      sha256 "03cfdd081eeb33c401982ab678fa6d35f9cfe95e092a3d51c702ab0c8f21e8ba"
    end
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.2/libsql-server-x86_64-apple-darwin.tar.xz"
      sha256 "fae00dff9f659d5154edef40eb42c2819cd64aa5c9be08e26ccc2743577e9aad"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/tursodatabase/libsql/releases/download/libsql-server-v0.24.2/libsql-server-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "8000ecf8ccab48799cff139c5fe09a950502546be2b2f27df264b92ea0327bc1"
    end
  end

  def install
    on_macos do
      on_arm do
        bin.install "sqld"
      end
    end
    on_macos do
      on_intel do
        bin.install "sqld"
      end
    end
    on_linux do
      on_intel do
        bin.install "sqld"
      end
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
