// Highlights Raindown directives in the home page's examples, on top of Prism's Markdown highlighting.
// Directives between "<{" and "}>" stay on one line and outside inline code, so "`<{` and `}>`" isn't one.
const directive = {
  pattern: /<\{[^`\n]*?\}>/,
  alias: 'keyword',
};

Prism.languages.insertBefore('markdown', 'bold', { directive });

// Raindown files can also write directives bare, on their own line, like "toc:", "endpoint: :x" or ":toc".
Prism.languages.raindown = Prism.languages.extend('markdown', {});
Prism.languages.insertBefore('raindown', 'bold', {
  directive,
  'bare-directive': {
    pattern: /^[ \t]*(?::[A-Za-z]\w*|[A-Za-z]\w*:(?:[ \t]+[^\n]*)?)$/m,
    alias: 'keyword',
  },
});

Prism.highlightAll();
// Wrapped lines change height when the web font loads, so the line numbers are measured again.
document.fonts.ready.then(() => Prism.highlightAll());
