require 'nanoc/tasks'

desc "Serve up the pages and auto-update them"
task :view do
  system "bundle exec nanoc view"
end

desc "Automatically re-compile pages on change"
task :watch do
  system "bundle exec nanoc watch"
end

desc "Compile everything"
task :compile  do
  system "bundle exec nanoc compile"
end

desc "Calculate dependencies"
task :debug  do
  system "bundle exec nanoc debug"
end

desc "Delete everything, re-generate and recompile everything"
task recreate: ["clean", :compile]  do
end

desc "deploy output"
task :deploy do
  cd "output" do
    system "git add ."
    system "git commit -m'update!'"
    system "git push"
  end
end


