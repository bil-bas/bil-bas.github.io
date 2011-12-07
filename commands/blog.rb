usage       'blog title [options]'
#aliases     :blo
summary     'Makes a blog post'
description <<END
Creates a blog post, optionally with tags.

    > nanoc blog I really like pies -t pies,pastry
END
option :t, :tags, 'specify tags', :argument => :optional

run do |opts, args, cmd|
  if args.empty?
    puts "Post requires a title"
    exit 0
  end
  tags = (opts[:tags] || "").downcase.split /[,;.]/
  title = args.map(&:strip).join " "

  now = Time.now

  base_dir = File.expand_path("../../", __FILE__) + "/"

  date = now.strftime("%Y-%m-%d")
  blog_file = File.join(base_dir, "content/blog/_posts", "#{date}_#{title.downcase.tr(" _", "-")}.md")

  raise "Blog with that name already exists" if File.exists? blog_file

  FileUtils.mkdir_p File.dirname blog_file

  File.open(blog_file, "w") do |file|
    file.puts <<END
---
kind: article
layout: blog_post
title: #{title}
created_at: #{now}
tags: #{tags}
---

(empty article)
END
  end

  puts "Blogged: #{blog_file.sub(base_dir, '')} with tags #{tags}"

  system "rake create:tags"
  system "rake create:years_and_months"
end