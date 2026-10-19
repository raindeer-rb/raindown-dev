---
title: Components
published: true
---

<{ :toc }>

### Table of Contents

Insert a table of contents that links to each heading on your page:
```ruby
<{ :toc }>
```

### Quote [UNRELEASED]

Insert a `<blockquote>` with correct `<figure>` semantics and author attribution:

```ruby
<{ quote: 'Name' }>
  The sentence said by some guy who died
<{ :quote }>
```

### List

List markdown files, filtered by specified metadata:

```ruby
<{ list: item folder: 'basics' }>
  {item.title}
<{ :list }>
```

**Available metadata:**
- `title` - *example:* "Getting Started"
- `path` - *example:* "docs/getting-started"
- `folder` - *example:* "basics"
- `order` - *example:* 1
- [Metadata](#metadata) defined in the frontmatter of the markdown files

List items are sorted by `order` by default. Change the ordering with:

```ruby
<{ list: item folder: 'basics' order: :created_at }>
  {item.title}
<{ :list }>
```

### Embed [UNRELEASED]

Include the contents of another markdown file:

```ruby
<{ embed: "/components/our-story.md" }>
```

> [!note]
> File paths can be relative (`../`) or absolute (`/`)

### Custom Component

Use [nodes](/docs/nodes) and Antlers to create custom components with their own HTML and access to Ruby.

First define your component:
```ruby
class CustomComponent < LowNode
  def render
    <html>{"Any text that you can dream of"}</html>
  end
end
```

Then call it in a Markdown/Raindown file:
```ruby
<{ CustomComponent }>
```

> [!WARNING]
> If you namespace your component then you need to configure that namespace in Raindown
