---
title: Endpoints
published: true
---

<{ :toc }>

Put an `endpoint:` directive above a curl snippet and Raindown writes the response in a code block below it, typed by its content type, followed by the date it was fetched:

````md
<{ endpoint: :x }>

```sh
curl https://httpbin.org/uuid
```

```json
{
  "uuid": "4c9d6a2e-…"
}
```
<!-- raindown:fetched 2026-10-14 -->
<{ :endpoint }>
````

In a [Raindown file](/docs/raindown-files) you can write `endpoint: :x` bare, which ends after the curl snippet and response, so there's no `<{ :endpoint }>`.

## Running requests

The request only runs when the response block is missing or empty, and either the directive has `:x` (or `:execute`) or you pass `-x` (or `--execute`):

```shell
raindown api.md -x
```

## Refreshing responses

To refresh a response, empty its code block, and its fetched date is updated too.

The date is an HTML comment, so it's hidden on the page, but anyone reading the file or the HTML source, people or agents, can tell how fresh the example is.

## Limits

The snippet runs with the `curl` binary but not through a shell, so pipes, redirects and `$VARIABLES` aren't supported.

Curl is limited to HTTP requests, values can't read files (`-d @body.json`), and other options like `-o`, `-F` or `-K` are rejected. Raindown also runs curl without your `~/.curlrc`.

> [!WARNING]
> An `endpoint: :x` directive runs its request when the file is rendered, without the `-x` flag. Check files you didn't write before rendering them. Reading a file, and the VS Code preview, never run endpoints.
