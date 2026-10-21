# frozen_string_literal: true

require 'erb'

# The Markdown and Raindown example files from the raindown repo, shown side by side on the home page.
class Examples
  Example = Data.define(:file, :language, :summary, :code)

  FILES = [
    ['raindown.rd', 'raindown', 'Raindown with `bare:` syntax'],
    ['markdown.md', 'markdown', 'Markdown with `<{ antlers: }>` syntax']
  ].freeze

  def self.all
    FILES.map do |file, language, summary|
      code = File.read(File.expand_path("public/examples/#{file}", Dir.pwd), encoding: Encoding::UTF_8).chomp
      Example.new(file:, language:, summary:, code: ERB::Util.html_escape(code))
    end
  end
end
