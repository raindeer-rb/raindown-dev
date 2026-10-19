---
title: Getting Started
published: true
---

<article id="contributors">
  <header>
    <h2>Contributors</h2>
  </header>

  <ul>
    <li>
      <img class="icon" src="https://avatars.githubusercontent.com/u/601650"/>
      <strong class="username">maedi</strong>
    </li>
  </ul>

  <footer>
    <a href="/docs/contributing" role="button"><i class="bi bi-code-square"></i>Contribute</a>
  </footer>
</article>

Raindown turns Markdown files into a dynamic AI harness, where input is transformed into output an AI agent can read before it runs, saving you tokens and increasing human clarity. Markdown files are messy, and now we have structure that helps humans and machines.

**Features:**

- An AI harness
- A documentation layer for humans
- A templating layer

All done via a Markdown or Raindown file.

## Markdown

Raindown can be used within a regular Markdown file by placing commands between Antlers syntax `<{` and `}>`.

## Raindown

If you use the `.rd` file extension instead then there's no requirement for the Antlers syntax. Just go straight for the keyword + colon syntax:

```markdown
constraint:
  - 1
  - 2
  - 3
```

### Syntax Highlighting

Use the Raindown VS Code plugin.
