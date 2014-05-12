require "bundler/gem_tasks"
require 'rspec/core/rake_task'

task :default => [:spec]

# RSpec tasks
desc "Run all examples"
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.ruby_opts = '-I lib'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rspec_opts = ['--color --format doc']
  spec.fail_on_error = true
end
