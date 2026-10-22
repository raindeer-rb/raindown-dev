---
title: Getting Started
published: true
---

<{ :toc }>

## Installation

**Download a standalone binary** with Ruby bundled inside:

| OS | x86_64 | ARM64 |
|----|--------|-------|
| <i class="bi bi-apple"></i> macOS | [Download](https://github.com/raindeer-rb/raindown/releases/latest/download/raindown-macos-x86_64) | [Download](https://github.com/raindeer-rb/raindown/releases/latest/download/raindown-macos-arm64) |
| <i class="bi bi-tux"></i> Linux | [Download](https://github.com/raindeer-rb/raindown/releases/latest/download/raindown-linux-x86_64) | [Download](https://github.com/raindeer-rb/raindown/releases/latest/download/raindown-linux-arm64) |
| <i class="bi bi-tux"></i> Linux (musl/Alpine) | [Download](https://github.com/raindeer-rb/raindown/releases/latest/download/raindown-linux-musl-x86_64) | [Download](https://github.com/raindeer-rb/raindown/releases/latest/download/raindown-linux-musl-arm64) |
| <i class="bi bi-windows"></i> Windows | [Download](https://github.com/raindeer-rb/raindown/releases/latest/download/raindown-windows-x86_64.exe) | — |

On macOS and Linux, make it executable and move it onto your `PATH`:
```shell
chmod +x raindown-*
mv raindown-* /usr/local/bin/raindown
```

**Alpine:**
The musl binaries need `libgcc`, which bare Alpine doesn't include (`apk add libgcc`).

**Ruby:**

If you have Ruby installed on your system then you can just run:
```shell
gem install raindown
```

## Updating

Download the binary again from the table above and replace the old one.

If you installed the gem via Ruby then do:
```shell
gem update raindown
```

## Setup

Run `raindown init` in the root of your project to setup the `.raindown` folder.

## Usage

**Then render a file:**
```shell
raindown README.md
```

This writes `README.html` beside `README.md`, then re-renders it every time the file is saved.

## Your first directive

Add a table of contents to any Markdown file:

```md
# Notes

<{ toc: }>
```

## VS Code extension

Highlight Raindown syntax with the [VS Code extension](/docs/extensions).
