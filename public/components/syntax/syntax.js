// Highlights code blocks with Prism, with Raindown's directives and variables on top of its Markdown highlighting.
// Raindown leaves code blocks unhighlighted for this, with highlight_code: false in .raindown/config.yml.

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

// The site's "md" code blocks show Raindown, so they get its grammar, bare directives included.
Prism.languages.md = Prism.languages.raindown;
Prism.languages.rd = Prism.languages.raindown;

// Other languages, like Ruby or YAML, are loaded when a page has them.
Prism.plugins.autoloader.languages_path = 'https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/';

Prism.highlightAll();
// Wrapped lines change height when the web font loads, so line numbers are measured again.
document.fonts.ready.then(() => Prism.highlightAll());
