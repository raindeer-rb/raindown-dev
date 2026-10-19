---
title: Nodes
published: true
---

<{ :toc }>

Nodes are your own [LowNodes](https://github.com/low-rb/lownode) that write Markdown into the file with `replace`, and render HTML into the page with `render`.

Put them in a `.raindown` folder beside your files, or in a folder above them, and Raindown loads them with [Dirload](https://github.com/low-rb/dirload):

```ruby
# .raindown/changelog.rb
class Changelog < LowNode
  def initialize(limit: 5)
    @releases = Release.all.first(limit)
  end

  # Written into the Markdown.
  def replace
    @releases.map { |release| "- **#{release.version}** #{release.summary}" }.join("\n")
  end

  # Rendered into the HTML. Without it, the HTML of the Markdown above is rendered.
  def render
    "<section class=\"changelog\">...</section>"
  end
end
```

## Node blocks

A node block names the node and its props, and Raindown writes the node's Markdown into it whenever the file is rendered:

```md
<{ Changelog: limit=3 }>

- **1.2.0** Bare directives close themselves
- **1.1.0** Track fetched dates

<{ :Changelog }>
```

In a [Raindown file](/docs/raindown-files) it can also use bare syntax, with the Markdown straight below it up to the next blank line (a bare node block can't write blank new lines):

```
Changelog: limit=3
- **1.2.0** Bare directives close themselves
- **1.1.0** Track fetched dates
```

A self-closing `<{ :Changelog }>`, or a bare `:Changelog`, renders the node into the HTML without writing it into the file.

## Props

Props can be quoted text, numbers, `true`, `false` or front matter keys like `author.name`, written `limit=3` or `limit: 3`.

`replace` and `render` can also take the keywords `document:` (the Markdown being rendered), `metadata:` and `bare:`, and get the ones they ask for.

## Lifecycle

Raindown keeps one instance of each node and its props while it runs, so `replace` and `render` can share what they work out, like the releases above.

A name only starts a node block when it's a loaded LowNode with a `replace` method, so other text like `Note:` is left alone.

> [!WARNING]
> Nodes run your project's code whenever Raindown renders the file.

## Built-in nodes

[Table of contents](/docs/table-of-contents) and [files](/docs/files-and-lists) are nodes too, and a project can replace them with its own `TOC` or `Files` node.
