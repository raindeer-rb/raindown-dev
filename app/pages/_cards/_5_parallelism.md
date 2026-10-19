---
title: Parallelism
summary: Immutable nodes designed for parallel execution
---

```ruby
<{ parallelize: }>
  <{ UserNode user=@user }>
  <{ PostsNode posts=@posts }>
<{ :parallelize }>
```
