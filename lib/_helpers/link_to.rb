# Extends the default link-to to add block handling and other fixes.
module LinkTo
  include Nanoc3::Helpers::LinkTo

  def link_to(*args, &block)
    if block_given?
      raise ArgumentError, "Block version requires: path_or_rep, [attributes]" unless (1..2).include? args.size
      link_to capture(&block), *args

    else
      raise ArgumentError, "Non-block version requires: text, path_or_rep, [attributes]" unless (2..3).include? args.size

      # Find path
      text, path_or_rep, attributes = *args
      attributes ||= {}

      path = path_or_rep.is_a?(String) ? path_or_rep : path_or_rep.path

      # Join attributes
      attributes = attributes.inject('') do |memo, (key, value)|
        memo + key.to_s + '="' + h(value) + '" '
      end

      # Create link
      "<a #{attributes}href=\"#{path}\">#{text}</a>"
    end
  end

  def link_to_unless_current(*args, &block)
    if block_given?
      raise ArgumentError, "Block version requires: path_or_rep, [attributes]" unless (1..2).include? args.size
      link_to_unless_current capture(&block), *args

    else
      raise ArgumentError, "Non-block version requires: text, path_or_rep, [attributes]" unless (2..3).include? args.size

      # Find path
      text, path_or_rep, attributes = *args
      attributes ||= {}

      path = path_or_rep.is_a?(String) ? path_or_rep : path_or_rep.path

      if @item_rep and @item_rep.path == path
        # Create message
        attributes = attributes.merge :title => "You're here."
        if attributes.has_key? :class
          attributes[:class] += " active"
        else
          attributes[:class] = "active"
        end

        attributes = attributes.inject('') do |memo, (key, value)|
          memo + key.to_s + '="' + h(value) + '" '
        end

        "<span #{attributes}>#{text}</span>"
      else
        link_to(text, path_or_rep, attributes)
      end
    end
  end
end