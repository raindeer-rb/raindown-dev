# frozen_string_literal: true

require 'net/http'
require 'json'

class Version < LowNode
  ENDPOINT = 'https://rubygems.org/api/v1/versions/raindown/latest.json'

  def initialize
    response = Net::HTTP.get(URI(ENDPOINT))
    @version = ::JSON.parse(response)['version']
  end

  def render
    <ul id="releases">
      <li>v{@version}</li>
      <li><a href="https://github.com/raindown-rb/raindown/issues/1">{"Roadmap"}</a></li>
      <li><a href="https://github.com/raindown-rb/raindown/tags">{"Releases"}</a></li>
    </ul>
  end
end
