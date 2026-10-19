---
title: Metadata
published: true
---

<{ :toc }>

**The humble underscore:** In summary, an underscore `_` followed by a string or number until a `-` or `/` adds metadata to a folder/file.

Metadata is made available to Raindown macros (such as ["List"](#list)) and the Raindown application (See ["Layout"](#layout)).

### Explicit metadata

Add metadata via the markdown file's frontmatter:
```markdown
---
tags: ['tag_1', 'tag_2', 'tag_3']
date: 2099
---
```

### Implicit metadata

#### Folder tags

Underscored values in file paths are automatically converted to metadata. For example, in the following file path...
```
app/pages/docs/_basics/_1-getting-started.md
```

...the `_basics` and `_1` prefixes produce metadata that is equivalent to the following frontmatter:
```markdown
---
folder: basics
order: 1
path: /docs/getting-started
---
```

`path` is automatically available too without manual entry, representing the absolute URL path.

> [!NOTE]
> Separate multiple folder tags with `&`:
> `app/pages/docs/_1&_basics/_1-getting-started.md`

#### Label tags [UNRELEASED]

Any uppercase text between two square brackets `[]` is considered a label tag. This is useful for defining the current status of an article, project or feature. For example:
- [DRAFT]
- [BETA]
- [UNRELEASED]

A label tag can be put in `title:` frontmatter or `## heading` and **NOT** have its characters visible in the URL or anchor link. Additionally it outputs CSS classes for more label-like styling.

## Collections

Collections are arrays of records that can be rendered anywhere; a page, a node, and *optionally* accessed directly via URL. Unlike other static site generators, you don't need to configure where collections live. Using the two established patterns of *The humble underscore™* and *Implicit metadata*, simply put underscore prefixed markdown files in underscore prefixed folders.

**For example:**
```
/app/pages/_cards/_fast.md
```

The `_cards` adds `folder: cards` metadata to every child file while hiding the folder from the URL, and the `_fast.md` hides the file from the URL. This file is now accessible only through metadata. Render these files elsewhere with lists:

### Rendering in a page

```ruby
<{ list: card folder: 'cards' }>
  {card.title}
<{ :list }>
```
