# homebrew-sqld
homebrew tap for sqld. Hopefully temporary, while we meet the requirements for inclusion in homebrew/core


## Updating

When a new version of sqld is released, update this by editing `Formula/sqld-beta.rb`
and change the following two fields:

```
  url "https://github.com/libsql/sqld/archive/refs/tags/v0.13.0.tar.gz"
  sha256 "9d7922de58a24267098c54f324c8a84918b889fd393fcecef94e09774836619f"
```

the `url` should always be about the same, except for the version.
The `sha256` is obtained by running `sha256sum` on that `.tar.gz`.
Just commit to main, and brew will pick it up.
