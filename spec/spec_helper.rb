require "simplecov"
require "coveralls"
Coveralls.wear!

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

SimpleCov.start do
  add_filter "spec"
  add_filter ".bundle"
end

ENV["RACK_ENV"] = "test"

$:.unshift(File.expand_path("../../lib", __FILE__))

require "ruby_gems_jsonp"
require "rack/test"

RSpec.configure do |config|
  config.include Rack::Test::Methods
end
