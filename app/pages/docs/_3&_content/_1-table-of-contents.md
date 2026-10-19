---
title: Table of Contents
published: true
---

<{ :toc }>

`<{ :toc }>` renders a table of contents of the file's headings in the HTML, like the one on this page.

## Writing it into the file

A `<{ toc: }>` block does that too, and also writes the table of contents into the Markdown below it as a list of links, updated whenever the file is rendered. That way people and agents reading the file see it as well:

```md
<{ toc: }>

- [Notes](#notes)
  - [Setup](#setup)

<{ :toc }>
```

The block needs `<{ :toc }>` after it.

## In Raindown files

In a [Raindown file](/docs/raindown-files) it can be a bare `toc:` with the list straight below it, and `:toc` on its own is always the HTML table of contents:

```
toc:
- [Notes](#notes)
  - [Setup](#setup)
```

## Customising

`toc:` and `:toc` are a [node](/docs/nodes), so a project can change them with its own `TOC` node, like `class TOC < Raindown::TOC`.
