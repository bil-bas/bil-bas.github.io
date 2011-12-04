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

desc "Delete everything, re-generate and recompile everything"
task recreate: ["clean", "create:years_and_months", "create:tags", :compile]  do
end

desc "Create content files for years and months everything"
task "create:years_and_months" do
  puts
  puts "** Generating year and month files"
  base_dir = File.dirname(__FILE__) + "/"
  Dir[File.join(base_dir, 'content/blog/_articles/*.md')].each do |article_path|
    article_path =~ %r[_articles/(\d{4})-(\d{2})]
    year, month = $1, $2
    year_filename = File.join(base_dir, "content/blog/#{year}/index.md")
    unless File.exists? year_filename
      FileUtils.mkdir_p File.dirname year_filename
      puts "Creating #{year_filename.sub(base_dir, '')}"
      File.open(year_filename, "w") do |file|
        file.write <<END
---
kind: year
title: "#{year}"
count_comments: true
---
END
      end
    end

    month_filename = File.join(base_dir, "content/blog/#{year}/#{month}.md")
    unless File.exists? month_filename
      FileUtils.mkdir_p File.dirname month_filename
      month_name = Date.new(2000, month.to_i, 1).strftime("%B")
      puts "Creating #{month_filename.sub(base_dir, '')} (#{month_name})"
      File.open(month_filename, "w") do |file|
        file.write <<END
---
kind: month
title: #{month_name}
count_comments: true
---
END
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
count_comments: true
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
  tags = tags.strip.split(/\W+/).downcase.sort

  now = Time.now

  base_dir = File.dirname(__FILE__) + '/'
  date = now.strftime("%Y-%m-%d")
  blog_file = File.join(base_dir, "content/blog/_articles", "#{date}_#{title.downcase.tr(" _", "-")}.md")
  FileUtils.mkdir_p File.dirname blog_file

  raise "Blog with that name already exists" if File.exists? blog_file

  File.open(blog_file, "w") do |file|
    file.puts <<END
---
kind: article
title: #{title}
created_at: #{now}
tags: #{tags}
---

(empty article)
END
  end

  puts "Blogged: #{blog_file.sub(base_dir, '')} with tags #{tags}"

  Rake::Task["create:tags"].invoke
  Rake::Task["create:years_and_months"].invoke
end

desc "Create a project release project"
task :release, :project, :version do |t, args|
  raise "Error: requires project and version" unless args[:version] and args[:project]

  project, version = args[:project].strip.downcase, args[:version].strip

  now = Time.now

  base_dir = File.dirname(__FILE__) + '/'
  underscored_project = project.tr " ", "_"
  type = %w[games libraries utilities].find {|t| File.exists? "#{base_dir}/content/#{t}/#{underscored_project}" }
  raise "Project name not recognised: #{project}" unless type

  release_file = "#{base_dir}content/#{type}/#{underscored_project}/releases/#{version.tr(".", "_")}.md"
  FileUtils.mkdir_p File.dirname(release_file)

  raise "Release with that version already exists" if File.exists? release_file
  raise "Version must follow pattern" unless version =~ /^v\d+(?:\.\d+)+[a-z]*$/

  File.open(release_file, "w") do |file|
    file.puts <<END
---
kind: article
title: #{version}
created_at: #{now}
---

* empty release
END
  end

  puts "Released: #{release_file.sub(base_dir, '')}"

  releases_file = "#{File.dirname(release_file)}/index.md"

  unless File.exists? releases_file
    File.open(releases_file, "w") do |file|
      file.puts <<END
---
title: Releases
kind: releases
count_comments: true
---

END
    end
  end

  puts "Created releases index: #{releases_file.sub(base_dir, '')}"


end



