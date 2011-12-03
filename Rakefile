begin
  require 'nanoc3/tasks'
rescue LoadError
  require 'rubygems'
  require 'nanoc3/tasks'
end

require 'FileUtils'

desc "Create tag pages"
task :create_tags do
  create_tags
end

desc "Serve up the pages and auto-update them"
task :serve do
  system "nanoc aco"
end

desc "Compile everything"
task :compile do
  system "nanoc compile"
  create_tags
end

# http://www.h3rald.com/articles/take-back-your-site-with-nanoc/
def create_tags
  site = Nanoc3::Site.new('.')
  dir = File.expand_path('content/blog/tags', Pathname(Dir.pwd))
  FileUtils.rmtree dir if File.exists?(dir)
  FileUtils.mkdir_p dir
  tags = Hash.new 0
  # Collect tag and page data
  site.items.each do |p|
    next unless p.attributes[:tags]
    p.attributes[:tags].each do |t|
      tags[t] += 1
    end
  end

  # Write pages
  tags.each_pair do |k, v|
    write_tag_page dir, k, v
    #write_tag_feed_page dir, k, 'RSS'
    #write_tag_feed_page dir, k, 'Atom'
  end
end

def write_tag_page(dir, tag, count)
  puts "Generating tag list for '#{tag}'"

  File.open(File.join(dir, "#{tag}.md"), "w") do |file|

    file.puts <<END
---
title: #{tag}
kind: tag
count: #{count}
---
END
  end
end


