class Nanoc3::Item
  def summary
    # Just include the first paragraph (article) or list (release).
    (Hpricot(compiled_content).at("p|ul") || "(empty article)").to_s
  end

  def feed_summary
    excerptize strip_html(compiled_content), length: 140
  end

  def home?; identifier == '/'; end

  def hidden?; self[:is_hidden]; end

  def year; self[:created_at].year; end
  def month; self[:created_at].month; end
  def month_name; Date::MONTHNAMES[month]; end
  def day; self[:created_at].day; end

  def created_at; self[:created_at] || raise(path); end
  def modified_at; self[:modified_at] || created_at; end

  def permalink; "http://spooner.github.com#{path}"; end
  def title; self[:title]; end
  def kind; self[:kind]; end
  def layout; self[:layout]; end

  # Page heading, as opposed to nav link.
  def full_title
    self[:full_title] || title
  end

  def article?; identifier =~ %r[^/\d{4}/\d{2}/[^/]+/$]; end
  def project?; identifier =~ %r[^/(?:games|libraries|utilities)/[^/]+/$]; end
  def blog_post?; article? and not release?; end
  def release?; article? and identifier =~ %r[v\d[_\d]+/$]; end

  def name; File.basename(identifier); end

  def meta_keywords
    if layout == 'articles'
      "ruby game games software development programming ai graphics"
    elsif article?
      self[:tags].join " "
    end
  end

  def meta_description
    if layout == 'articles'
      "Spooner's game-making blog and project portfolio, focusing on Ruby development"
    else
      nil
    end
  end
end