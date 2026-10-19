# frozen_string_literal: true

class Status404Node < LowNode
  observe Status[404]

  def render
    <div class="status-404">
      <em>404</em>
    </div>
  end
end
