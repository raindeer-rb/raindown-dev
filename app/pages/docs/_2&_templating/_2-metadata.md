---
title: Metadata
published: true
---

<{ :toc }>

[Files and lists](/docs/files-and-lists) list the Markdown files in your project by their metadata. The project is the folder with your [`.raindown`](/docs/nodes) folder, or else the folder of the file being rendered.

## Front matter

A file's front matter is its metadata, and a list like `tags: [ruby, intro]` tags it with each item:

```md
---
title: Getting started
tags: [ruby, intro]
---
```

## Folder tags

**The humble underscore:** Underscored folders in a file's path are metadata too. `docs/_basics/_1-getting-started.md` has:

```yaml
folder: basics
order: 1
path: docs/_basics/_1-getting-started.md
```

The `path` is relative to the project, so the links `files:` writes work in the Markdown, like on GitHub.

Files are listed by `order`, and separate several folder tags with `&`, like `docs/_1&_basics/getting-started.md`.

> [!TIP]
> This site's pages live in folders like `docs/_1&_basics`, which puts them in order and in their sidebar group.

## Filtering

Filter by any of a file's tags, with quoted values, since unquoted ones are front matter keys:

```md
files: folder: 'basics'

files: tags: 'intro'
```
