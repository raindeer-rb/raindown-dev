# frozen_string_literal: true

class NavGroup < LowNode
  def initialize(event:, title:, links:)
    @title = title
    @links = links
  end

  def render
    <details open>
      <summary>{@title}</summary>
      <ul>
        <{ for: link in: @links }>
          <{ NavLink link=link }
        <{ :for }>
      </ul>
    </details>
  end
end
