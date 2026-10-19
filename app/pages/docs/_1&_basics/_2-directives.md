---
title: Directives
published: true
---

<{ :toc }>

Directives sit between `<{` and `}>`, and come in two kinds:

|                       | Template directives                                 | Content directives                                                    |
| --------------------- | --------------------------------------------------- | --------------------------------------------------------------------- |
| Examples              | `for:`, `if:`, `list:` and variables like `{title}` | `toc:`, `:toc`, `files:`, `endpoint:` and your own nodes              |
| What they do          | Shape how the Markdown around them renders          | Bring content into the page, written into the file, the HTML, or both |
| Who writes the output | You, as a template                                  | Raindown or your node, from your input                                |
| Where they sit        | Often inside paragraphs, tables and lists           | On their own lines, between blocks                                    |
| In the HTML           | Invisible, since the input is a template            | In bold, or as comments with `hide_directives`                        |

## Template directives

Shape how the Markdown around them renders, like Liquid or Jinja: [variables](/docs/variables) like `{title}`, loops with `for:`, conditions with `if:` and [lists](/docs/files-and-lists) with `list:`.

You write their output as a template, and they decide whether it appears and how many times, filling in values like `{title}`. They're invisible in the HTML, since the input is a template, and showing them would break the tables and lists they often sit in.

## Content directives

Bring content into the page: a [table of contents](/docs/table-of-contents) with `toc:` and `:toc`, [files](/docs/files-and-lists) with `files:`, [endpoints](/docs/endpoints) with `endpoint:` and your own [nodes](/docs/nodes).

Raindown or your node writes their output, and you only give them input, like `folder: 'notes'` or an endpoint's curl snippet. Most also write their content into the Markdown below them, so it's there for people and agents reading the file.

They sit on their own lines between content blocks, and show in bold in the HTML, so you can see where a page's content comes from, unless you [hide them](/docs/config).

## Blocks and end tags

A block directive wraps the Markdown it applies to, and closes with an end tag named after it:

```md
<{ if: draft }>
This is a draft.

It has two paragraphs.
<{ :if }>
```

A directive with no block, like `<{ :toc }>`, closes itself. Directives in prose or code are left as text.

> [!TIP]
> In a [Raindown file](/docs/raindown-files) most directives can be written bare, without delimiters or end tags.
