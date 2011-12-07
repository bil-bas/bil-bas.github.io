begin
  require 'nanoc3/tasks'
rescue LoadError
  require 'rubygems'
  require 'nanoc3/tasks'
end

require 'date'

desc "Serve up the pages and auto-update them"
task :view do
  system "nanoc view"
end

desc "Automatically re-compile pages on change"
task :watch do
  system "nanoc watch"
end

desc "Compile everything"
task :compile  do
  system "nanoc compile"
end

desc "Delete everything, re-generate and recompile everything"
task recreate: ["clean", :compile]  do
end


