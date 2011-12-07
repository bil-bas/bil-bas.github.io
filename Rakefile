begin
  require 'nanoc3/tasks'
rescue LoadError
  require 'rubygems'
  require 'nanoc3/tasks'
end

desc "Serve up the pages and auto-update them"
task :view do
  system "bundle exec nanoc3 view"
end

desc "Automatically re-compile pages on change"
task :watch do
  system "bundle exec nanoc3 watch"
end

desc "Compile everything"
task :compile  do
  system "bundle exec nanoc3 compile"
end

desc "Calculate dependencies"
task :debug  do
  system "bundle exec nanoc3 debug"
end

desc "Delete everything, re-generate and recompile everything"
task recreate: ["clean", :compile]  do
end


