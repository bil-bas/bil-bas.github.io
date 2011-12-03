begin
  require 'nanoc3/tasks'
rescue LoadError
  require 'rubygems'
  require 'nanoc3/tasks'
end

require 'date'

desc "Serve up the pages and auto-update them"
task :serve do
  system "nanoc aco"
end

desc "Compile everything"
task :compile  do
  system "nanoc compile"
end

desc "Compile everything"
task recreate: ["create:years_and_months", "create:tags", :compile]  do
end

desc "Create content files for years and months everything"
task "create:years_and_months" do
  puts
  puts "** Generating year and month files"
  base_dir = File.dirname(__FILE__) + "/"
  Dir[File.join(base_dir, 'content/blog/*')].each do |year|
    if File.directory? year and File.basename(year).to_i > 0
      puts "Creating #{year.sub(base_dir, '')}.md"
      File.open("#{year}.md", "w") do |file|
        file.write <<END
---
kind: year
title: "#{File.basename(year)}"
---
END
      end

      (1..12).each do |month|
        filename = File.join(base_dir, 'content/blog/', File.basename(year), "#{month.to_s.rjust(2, "0")}.md")
        month_name = Date.new(2000, month, 1).strftime("%B")
        puts "Creating #{filename.sub(base_dir, '')} (#{month_name})"
        File.open(filename, "w") do |file|
          file.write <<END
---
kind: month
title: #{month_name}
---
END
        end
      end
    end
  end

  puts
end

# http://www.h3rald.com/articles/take-back-your-site-with-nanoc/
desc "Create tag pages"
task "create:tags" do
  puts
  puts "** Generating tag files"

  site = Nanoc3::Site.new('.')
  dir = File.dirname(__FILE__)
  tags_dir = File.expand_path('content/blog/tags', dir)
  FileUtils.rmtree tags_dir if File.exists?(tags_dir)
  FileUtils.mkdir_p tags_dir
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
    write_tag_page tags_dir, k, v
  end

  puts
end

def write_tag_page(tag_dir, tag, count)
  dir = File.dirname(__FILE__) + '/'
  tag_file = File.join(tag_dir, "#{tag}.md")
  puts "Created: #{tag_file.sub(dir, '')}"

  File.open(tag_file, "w") do |file|
    file.puts <<END
---
title: #{tag}
kind: tag
count: #{count}
---
END
  end
end


