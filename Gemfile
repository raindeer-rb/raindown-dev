# frozen_string_literal: true

source 'https://rubygems.org'

gem 'raindown'

group :development do
  local_gems = {
    'lowevent' => '../lowevent',
    'lowloop' => '../lowloop',
    'lownode' => '../lownode',
    'lowtype' => '../lowtype',
    'lowkey' => '../lowkey',

    'antlers' => '../antlers',
    'dirload' => '../dirload',
    'expressions' => '../expressions',
    'observers' => '../observers',
    'plugs' => '../plugs',
    'providers' => '../providers',
    'trees' => '../trees',
  }

  local_gems.each do |name, relative_path|
    if File.exist?(File.expand_path(relative_path, __dir__))
      gem name, path: relative_path
    else
      gem name
    end
  end

  gem 'irb'
  gem 'rake', '~> 13.0'
  gem 'rubocop', require: false
end

group :testing do
  gem 'rspec'
  gem 'timecop'
end
