// Highlights the home page's examples and card snippets, with Raindown directives on top of Prism's Markdown highlighting.
// Directives between "<{" and "}>" stay on one line and outside inline code, so "`<{` and `}>`" isn't one.
const directive = {
  pattern: /<\{[^`\n]*?\}>/,
  alias: 'keyword',
};

// Variables like "{title}" or "{page.title}", but not the "{" in "<{".
const variable = {
  pattern: /(^|[^<])\{[A-Za-z_][\w.]*\}/,
  lookbehind: true,
};

Prism.languages.insertBefore('markdown', 'bold', { directive, variable });
// Headings are one token, so variables in them like "## {page.title}" are highlighted inside it.
Prism.languages.markdown.title.forEach((title) => {
  title.inside = { ...title.inside, variable };
});

// Raindown files can also write directives bare, on their own line, like "toc:", "endpoint: :x" or ":toc".
Prism.languages.raindown = Prism.languages.extend('markdown', {});
Prism.languages.insertBefore('raindown', 'bold', {
  directive,
  variable,
  'bare-directive': {
    pattern: /^[ \t]*(?::[A-Za-z]\w*|[A-Za-z]\w*:(?:[ \t]+[^\n]*)?)$/m,
    alias: 'keyword',
  },
});

// Raindown already highlighted the cards' code on the server, so it's swapped for plain code that Prism highlights
// the same way as the examples. Markdown snippets use the Raindown grammar, so bare directives like "toc:" stand out too.
document.querySelectorAll('#cards pre[lang]').forEach((pre) => {
  const language = pre.getAttribute('lang');
  const code = document.createElement('code');
  code.className = `language-${language === 'md' ? 'raindown' : language}`;
  code.textContent = pre.textContent;
  pre.removeAttribute('style');
  pre.replaceChildren(code);
});

Prism.highlightAll();
// Wrapped lines change height when the web font loads, so the line numbers are measured again.
document.fonts.ready.then(() => Prism.highlightAll());
