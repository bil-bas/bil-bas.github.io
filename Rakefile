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

      Dir[File.join(year, "*")].each do |month_path|
        month_num = File.basename(month_path).to_i
        if File.directory? month_path and month_num > 0
          month_name = Date.new(2000, month_num, 1).strftime("%B")
          puts "Creating #{month_path.sub(base_dir, '')} (#{month_name})"
          File.open("#{month_path}.md", "w") do |file|
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


desc "Create a blog entry - tags should be separated by ;"
task :blog, :title, :tags do |t, args|
  raise "Error: requires title" unless args[:title]
  args.with_defaults(tags: "")

  title, tags = args[:title], args[:tags]

  title.strip!
  tags = tags.strip.split(";")

  today = Time.now.to_date

  base_dir = File.dirname(__FILE__) + '/'
  year, month = today.year.to_s, today.month.to_s.rjust(2, "0")
  blog_file = File.join(base_dir, "content/blog", year, month, "#{title.downcase}.md")
  FileUtils.mkdir_p File.dirname blog_file

  raise "Blog with that name already exists" if File.exists? blog_file

  File.open(blog_file, "w") do |file|
    file.puts <<END
---
kind: article
title: #{title.tr("-", " ")}
created_at: #{today.strftime("%Y-%m-%d")}
tags: #{tags}
---

(empty article)
END
  end

  puts "Created: #{blog_file.sub(base_dir, '')} with tags #{tags}"

  Rake::Task["create:tags"].invoke
  Rake::Task["create:years_and_months"].invoke
end


