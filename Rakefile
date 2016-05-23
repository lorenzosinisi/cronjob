require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :c do
  exec "irb -r cronjob -I ./lib"
end
