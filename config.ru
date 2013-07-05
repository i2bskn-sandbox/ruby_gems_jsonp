$:.unshift(File.expand_path("../lib", __FILE__))

require "bundler/setup"
require "ruby_gems_jsonp"

run RubyGemsJsonp::Application
