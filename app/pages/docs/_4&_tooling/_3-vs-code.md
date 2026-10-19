---
title: VS Code
published: true
---

<{ :toc }>

The [VS Code extension](https://github.com/raindeer-rb/raindown/tree/main/vscode) highlights syntax and previews Raindown files with `--stdin`, rendering as you type. In Markdown files it highlights `<{ }>` directives and renders them in the built-in Markdown preview.

|                                       | Markdown (`.md`)                       | Raindown (`.rd`, `.raindown`)                                   |
| ------------------------------------- | -------------------------------------- | --------------------------------------------------------------- |
| Highlights `<{ :toc }>` directives    | ✓                                      | ✓                                                               |
| Highlights bare directives like `:toc` |                                       | ✓                                                               |
| Preview                               | The built-in Markdown preview          | **Raindown: Open Preview** (`Cmd+Shift+V`)                      |

Directives in code and comments aren't highlighted, matching what Raindown renders.

The previews render the unsaved text with `raindown FILE --stdin`, so they update as you type and never change the file. The table of contents and table alignment are written to the file by `raindown FILE`, and endpoints only run there with `-x`.

## Requirements

The `raindown` executable, from the [standalone binary](/docs/binaries) or via `gem install raindown`. If `raindown` isn't on your `PATH` then set `raindown.path` to the full path of the executable.

## Settings

| Setting                    | Default    | Description                                                |
| -------------------------- | ---------- | ---------------------------------------------------------- |
| `raindown.path`            | `raindown` | The file path to the raindown executable                   |
| `raindown.markdownPreview` | `true`     | Highlight Raindown syntax in the built-in Markdown preview |

> [!TIP]
> Turn off `markdownPreview` to keep the plain preview, which also keeps its scroll sync.
