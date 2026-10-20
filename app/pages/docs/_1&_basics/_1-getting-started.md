---
title: Getting Started
published: true
---

<{ :toc }>

Raindown is a templating layer for static site generation and an annotation framework for Markdown files.

It turns Markdown files into a harness for AI, where input is transformed into output an agent can read before it runs, saving you tokens and increasing human clarity. Markdown files are messy, and now we have structure that helps humans and machines.

## Binary

**Download a standalone binary** with Ruby bundled inside:

| OS                  | x86_64 | ARM64 |
|---------------------|--------|-------|
| macOS               | [Download](https://github.com/raindeer-rb/raindown/releases/latest/download/raindown-macos-x86_64) | [Download](https://github.com/raindeer-rb/raindown/releases/latest/download/raindown-macos-arm64) |
| Linux               | [Download](https://github.com/raindeer-rb/raindown/releases/latest/download/raindown-linux-x86_64) | [Download](https://github.com/raindeer-rb/raindown/releases/latest/download/raindown-linux-arm64) |
| Linux (musl/Alpine) | [Download](https://github.com/raindeer-rb/raindown/releases/latest/download/raindown-linux-musl-x86_64) | [Download](https://github.com/raindeer-rb/raindown/releases/latest/download/raindown-linux-musl-arm64) |
| Windows             | [Download](https://github.com/raindeer-rb/raindown/releases/latest/download/raindown-windows-x86_64.exe) | — |

On macOS and Linux, make it executable and move it onto your `PATH`:
```shell
chmod +x raindown-*
mv raindown-* /usr/local/bin/raindown
```

See [Binaries](/docs/binaries) for more.

## Ruby

**Or install the gem** if you have Ruby:
```shell
gem install raindown
```

## Updating

Download the binary again from the table above and replace the old one. Or if you installed the gem:
```shell
gem update raindown
```

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

<{ :toc }>

## Setup
```

Or give the file the `.rd` extension and drop the delimiters:

```rd
# Notes

:toc

## Setup
```

## Next steps

<{ list: page folder: 'templating' }>
- [{page.title}]({page.path})
<{ :list }>
<{ list: page folder: 'content' }>
- [{page.title}]({page.path})
<{ :list }>
<{ list: page folder: 'tooling' }>
- [{page.title}]({page.path})
<{ :list }>
