---
title: Raindown Files
published: true
---

<{ :toc }>

Raindown is a superset of Markdown. Give a file the `.rd` or `.raindown` extension and a directive on its own line no longer needs delimiters:

```
# Notes

:toc
```

## Bare directives

Bare directives have no end tags. A block directive like `if:` or `for:` applies to the Markdown block below it, up to the next blank line:

```
if: draft
This is a draft.
```

When a block needs to hold more than that, like several paragraphs, write it with delimiters and an end tag, which works in `.md` and `.rd`:

```
<{ if: draft }>
This is a draft.

It has two paragraphs.
<{ :if }>
```

Directives in prose or code are left as text.

## Markdown files

Markdown files can opt in to bare directives too, with the `--bare` flag:

```shell
raindown README.md --bare
```

## Syntax highlighting

The [VS Code extension](/docs/vs-code) highlights bare directives in `.rd` files, and `<{ }>` directives in Markdown files.
