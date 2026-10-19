---
title: Files and Lists
published: true
---

<{ :toc }>

## Files

A `files:` block writes a link to each file in a folder, by its title, into the Markdown, and renders them as a list in the HTML:

```md
<{ files: folder: 'notes' }>

- [Getting started](docs/_notes/_1-getting-started.md)
- [Setup](docs/_notes/_2-setup.md)

<{ :files }>
```

The files come from the [metadata](/docs/metadata) of your project's Markdown files.

`files:` is a [node](/docs/nodes) too, so a project can list files its own way with a `Files` node that overrides `replace` or adds `render`, like `class Files < Raindown::Files`, where `files(metadata:)` gives each file's front matter, `path` and `content`.

## Lists

To render the files with your own template instead, use a `list:` block. Its template repeats for each file, and only renders in the HTML:

```md
<{ list: page folder: 'notes' }>
## {page.title}
<{ :list }>
```

For example, this list of the templating pages is a `list:` block:

<{ list: page folder: 'templating' }>
- [{page.title}]({page.path})
<{ :list }>
