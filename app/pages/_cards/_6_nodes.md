---
title: Nodes
summary: Extend component directives with your own custom code
---

```ruby
class Changelog < LowNode
  def replace = "- **1.2.0** ..."
end
```

Use with:
```md
Changelog:
  - **1.2.0** ...
```
