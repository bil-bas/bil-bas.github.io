module ImagesAndVideos
  def screenshot(image, alt, title = alt)
    render 'screenshot', image: image, alt: alt, title: title
  end

  def gallery(*screenshots)
    render 'gallery', screenshots: screenshots
  end
end