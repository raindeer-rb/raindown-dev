# frozen_string_literal: true

class HomeNode < LowNode
  observe '/'

  def initialize(event:)
    @title = 'A Markdown superset for AI, APIs, Docs... and humans'
    @cards = Raindeer.pages.list(folder: 'cards')
    @cloud = RainCloud.new.html
    @examples = Examples.all
  end

  def render(event:)
    <{ Layout: title=@title section='section-home' }>
      <div id="raindown" role="img" aria-label="Raindown">
        <{ @cloud }>
      </div>

      <div id="overview">
        <p>{"A Markdown superset for AI, APIs, Docs... and humans"}</p>
        <p><strong>{"Stay sane out there."}</strong></p>

        <span class="actions">
          <a href="/docs/getting-started" role="button"><i class="bi bi-book"></i>{"Getting Started"}</a>
        </span>

        <{ Version }>
      </div>

      <div id="cards" class="grid">
        <{ for: card in: @cards }>
          <{ Card card=card }>
        <{ :for }>
      </div>

      <section id="examples">
        <h2>{"Markdown or Raindown"}</h2>
        <p class="lead">{"The same example, as a Markdown file and as a Raindown file."}</p>

        <div class="pages">
          <{ for: example in: @examples }>
            <figure class="page">
              <figcaption>
                <span class="file"><i class="bi bi-file-earmark-text"></i>{example.file}</span>
                <span class="summary">{example.summary}</span>
              </figcaption>
              <pre class="line-numbers"><code class="language-{example.language}"><{ example.code }></code></pre>
            </figure>
          <{ :for }>
        </div>
      </section>

      <section id="objective">
        <p class="kicker"><i class="bi bi-incognito"></i>{"Secret objective"}</p>
        <p>{"To make programming fun again... AI is here but we can write the guard rails and get to code again... okay it's a templating language but we're so close! The tapping of the keys, the joy of syntax, the connections between files, it's all there, maybe we can live again?"}</p>
      </section>

      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/themes/prism-tomorrow.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/plugins/line-numbers/prism-line-numbers.min.css">
      <link rel="stylesheet" href="/components/examples/examples.css">
      <script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/prism.min.js" data-manual defer></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/prism-markdown.min.js" defer></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/prism-ruby.min.js" defer></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/plugins/line-numbers/prism-line-numbers.min.js" defer></script>
      <script src="/components/examples/examples.js" defer></script>
    <{ :Layout }>
  end
end
