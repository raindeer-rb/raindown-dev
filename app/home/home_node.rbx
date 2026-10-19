# frozen_string_literal: true

class HomeNode < LowNode
  observe '/'

  def initialize(event:)
    @title = 'A Markdown superset for AI, APIs, Docs... and humans'
    @cards = Raindeer.pages.list(folder: 'cards')
    @cloud = RainCloud.new.html
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
        </p>

        <{ Version }>
      </div>

      <div id="cards" class="grid">
        <{ for: card in: @cards }>
          <{ Card card=card }>
        <{ :for }>
      </div>

      <div class="teaser">
        <div class="content">
          <h2>{"Secret Objective... "}</h2>
          <p>{"To make programming fun again... okay it's a templating language but we're so close! AI can't write the specs, only we humans can tell AI what to do. And to do that we get to code again... The roar of the tapping of the keys, the joy of syntax, the connections between files, it's all there, maybe we can live again?"}</p>
        </div>
      </div>
    <{ :Layout }>
  end
end
