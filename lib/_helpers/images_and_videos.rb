module ImagesAndVideos

  def screenshot(image, alt, title = alt)
    attributes = {
        class: "thumb",
        src: "/images/screenshots/#{image}-thumbnail.png",
        alt: alt,
        title: title,
    }
    attributes = attributes.map {|k, v| %[#{k}="#{v}"]}.join " "

    link_to "<img #{attributes}/>", "/images/screenshots/#{image}.png", rel: "lightbox-gallery", title: title
  end

  def gallery(*screenshots)
    %[<div class="gallery">#{screenshots.map {|d| screenshot *d }.join}</div>]
  end

  def video(id, width, height)
    attributes = {
        type: "text/html",
        class: "youtube-player",
        width: width,
        height: height,
        src: "http://www.youtube.com/embed/#{id}",
    }
    attributes = attributes.map {|k, v| %[#{k}="#{v}"]}.join " "

    "<iframe #{attributes} />"
  end
end