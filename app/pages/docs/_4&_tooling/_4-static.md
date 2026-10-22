---
title: Static Site Generation
published: true
---

<{ :toc }>

You can also use Raindown for static site generation. [Raindeer](https://raindeer.dev) uses Raindown to render its static site pages, including the page you're reading right now on this very website.

## How it works

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

*So try [Raindeer](https://raindeer.dev) today and get 50% off your first payment of FREE!*
