# frozen_string_literal: true

class NavLink < LowNode
  def initialize(event:, link:)
    @link = link
    @title = link.menu ? link.menu : link.title
  end

  def render
    <{ if: @link.published }>
      <li><a href="{@link.path}">{@title}</a></li>
    <{ :if }>
  end
end
