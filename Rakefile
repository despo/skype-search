require 'rspec/core/rake_task'
require 'bundler'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_path = 'rspec'
  t.rspec_opts = ["-cfd"]
end

task :default => :spec

Bundler::GemHelper.install_tasks
