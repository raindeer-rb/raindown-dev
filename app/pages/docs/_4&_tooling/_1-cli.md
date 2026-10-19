---
title: CLI
published: true
---

<{ :toc }>

The gem ships a `raindown` executable that renders a Markdown file (including directives like `<{ :toc }>`) to HTML, then re-renders it every time the file is saved.

```shell
# Write to README.html beside README.md:
raindown README.md

# Write to another path:
raindown README.md -o site/index.html

# Render once without watching, to stdout or with -o to a file:
raindown README.md --once

# Render Markdown from stdin without touching the file (for editor previews):
cat draft.rd | raindown draft.rd --stdin
```

With `--stdin`, the file only decides whether bare directives are allowed (by its extension), so it doesn't need to exist yet, and the table of contents and tables aren't written back to it.

## Options

| Option                | Description                                                           |
| --------------------- | --------------------------------------------------------------------- |
| `-o`, `--output PATH` | Write output to `PATH` instead of `FILE.html` beside the file         |
| `--once`              | Render once without watching, printing to stdout unless `-o` is given |
| `--stdin`             | Render Markdown from stdin once, without writing back to the file     |
| `--bare`              | Allow [bare directives](/docs/raindown-files) like `:toc` in Markdown files |
| `-x`, `--execute`     | Run [endpoint](/docs/endpoints) curl snippets that have no output yet |
| `-h`, `--help`        | Show the usage                                                        |

## Writing back

Unless it reads from stdin, Raindown also writes back to the file it renders: content directives like `toc:` and `files:` fill in their Markdown, endpoints write their responses, and tables are aligned.
