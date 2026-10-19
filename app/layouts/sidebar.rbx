# frozen_string_literal: true

class Sidebar < LowNode
  Group = Data.define(:title, :links)

  def initialize
    @nav_groups = ['Basics', 'Connections', 'Features', 'Advanced', 'Tooling'].map do |folder|
      list = Raindown.pages.list(false, folder: folder.downcase.gsub(' ', '_'))
      Group.new(folder, list)
    end
  end

  def render
    <aside id="sidebar">
      <nav id="docsnav">
        <{ for: nav_group in: @nav_groups }>
          <{ NavGroup title=nav_group.title links=nav_group.links }>
        <{ :for }>
      </nav>
    </aside>
  end
end
