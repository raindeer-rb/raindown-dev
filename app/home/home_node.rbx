# frozen_string_literal: true

class HomeNode < LowNode
  observe '/'

  def initialize(event:)
    @cards = Raindeer.pages.list(folder: 'cards')
  end

  def render(event:)
    <{ Layout: section='section-home' }>
      <img id="raindown" src="/assets/logo.png"/>

      <div id="overview">
        <p>{"A Markdown superset for AI and humans"}</p>
        <p><strong>{"Stay sane out there."}</strong></p>
        <p class="actions"><a href="/docs/getting-started" role="button"><i class="bi bi-book"></i>{"Getting Started"}</a></p>
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
          <p>{"To make programming fun again. AI can't write the specs, only you the human can tell AI what to do. And to do that we get to code again... okay it's a templating language but we're so close! The roar of the key taps, the joy of the syntax, the connections between files, it's all there, maybe we can live again?"}</p>
        </div>
      </div>
    <{ :Layout }>
  end
end
