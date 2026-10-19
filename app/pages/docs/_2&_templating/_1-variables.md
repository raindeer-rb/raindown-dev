---
title: Variables
published: true
---

<{ :toc }>

Front matter keys are variables, which render with `{key}`, or `<{ key }>` to leave HTML unescaped:

```md
---
title: Release notes
author:
  name: Mark
tags: [ruby, markdown]
draft: false
---

{title}

{author.name}
```

Unknown variables render nothing, and variables in code are left as text.

## Loops

Loop over a list with `for:`:

```md
<{ for: tag in: tags }>
- {tag}
<{ :for }>
```

## Conditions

Render a block only when a value is true with `if:`:

```md
<{ if: draft }>
This is a draft.
<{ :if }>
```

## Render order

Variables, loops and conditions render before the Markdown does, like Liquid in Jekyll. So a loop's lines make one list or table, and a value can contain Markdown like `*emphasis*`.

> [!NOTE]
> Template directives are always invisible in the HTML, since their input is a template.
