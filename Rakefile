# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: %i[spec rubocop]

desc "Generate Parser"
task :parser do
  `racc lib/edir/204.y -o lib/edir/parser.rb`
end

task :parser_debug do
  `racc -g lib/edir/204.y -o lib/edir/parser.rb`
end
