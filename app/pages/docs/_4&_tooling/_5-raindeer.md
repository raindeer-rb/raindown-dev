---
title: Raindeer
published: true
---

<{ :toc }>

[Raindeer](https://raindeer.dev) renders its pages with Raindown, including the page you're reading.

## Pages

Markdown and Raindown files under `app/pages` become pages, and their [folder tags](/docs/metadata) are removed from the URL:

```
app/pages/docs/_1&_basics/_1-getting-started.md => /docs/getting-started
```

Files in underscored folders, like `app/pages/_cards/_fast.md`, have no URL of their own and are only listed by their metadata.

## Differences

When Raindeer renders a page, unlike the Raindown CLI:

- It doesn't write back to the file
- Directives are always hidden in the HTML
- A file's `path` metadata is its URL path, like `/docs/getting-started`

## Pages in nodes

List pages from a node with `Raindeer.pages`:

```ruby
class HomeNode < LowNode
  observe '/'

  def initialize(event:)
    @cards = Raindeer.pages.list(folder: 'cards')
  end
end
```
