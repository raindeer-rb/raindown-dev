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

Raindown is a templating layer for static site generation and an annotation framework for Markdown files.

It turns Markdown files into a harness for AI, where input is transformed into output an agent can read before it runs, saving you tokens and increasing human clarity. Markdown files are messy, and now we have structure that helps humans and machines.

**Install the gem:**
```shell
gem install raindown
```

Or download a [standalone binary](/docs/binaries) with Ruby bundled inside.

**Then render a file:**
```shell
raindown README.md
```

This writes `README.html` beside `README.md`, then re-renders it every time the file is saved.

## Your first directive

Add a table of contents to any Markdown file:

```md
# Notes

<{ :toc }>

## Setup
```

Or give the file the `.rd` extension and drop the delimiters:

```
# Notes

:toc

## Setup
```

## Next steps

<{ list: page folder: 'templating' }>
- [{page.title}]({page.path})
<{ :list }>
<{ list: page folder: 'content' }>
- [{page.title}]({page.path})
<{ :list }>
<{ list: page folder: 'tooling' }>
- [{page.title}]({page.path})
<{ :list }>
