$:.unshift(File.expand_path("../lib", __FILE__))

require "bundler/setup"
require "ruby_gems_jsonp"

begin
  require "rspec/core/rake_task"

  desc "Run all specs"
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.rspec_opts = ["-fs", "-c"]
  end
rescue LoadError
  # Nothing to do
else
  task :default => :spec
end
