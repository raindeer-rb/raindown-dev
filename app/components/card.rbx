# frozen_string_literal: true

class Card < LowNode
  def initialize(event:, card:)
    @tooltip = 'Hand-written by humans'
    @tooltip = 'Made with/for AI' if card.label == 'AI'
  end

  def render(event:, card:)
    <article class="card">
      <header>
        <h3>
          <{ if: card.title_icon }>
            <i class="bi bi-{card.title_icon}"></i>
          <{ :if }>

          <{ if: card.title_link }><a href="{card.title_link}"><{ :if }>
          {card.title}
          <{ if: card.title_link }></a><{ :if }>

          <{ if: card.label }>
            <mark data-tooltip="{@tooltip}">{card.label}</mark>
          <{ :if }>
        </h3>
      </header>

      <div class="content">
        <{ if: card.icon }>
          <i class="bi bi-{card.icon}"></i>
        <{ :if }>

        <{ if: card.summary }>
          <p>{card.summary}</p>
        <{ :if }>

        <{ card.content }>
      </div>
    </article>
  end
end
