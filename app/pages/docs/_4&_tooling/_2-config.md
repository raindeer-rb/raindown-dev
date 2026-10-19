---
title: Config
published: true
---

A project can keep settings in `config.yml` in its [`.raindown`](/docs/nodes) folder.

## Hide directives

[Content directives](/docs/directives) like `toc:`, `files:`, a node's or an endpoint's show in bold in the HTML, so you can see where a page's content comes from. Hide them as HTML comments with:

```yaml
# .raindown/config.yml
hide_directives: true
```

Template directives are always invisible in the HTML.
