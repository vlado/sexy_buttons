module SexyButtons
  module ViewHelpers
    
    def sexy_buttons_stylesheet_link_tag(*themes)
      if themes.first.to_s == "all"
        themes = Dir.entries("#{SexyButtons.pub_dir}/themes").delete_if { |e| !File.directory?("#{SexyButtons.pub_dir}/themes/#{e}") or e.match(/^\./) }
      end
      themes.delete("default")
      themes.unshift("default")
      links = stylesheet_link_tag(*themes.collect { |t| "#{SexyButtons.pub_root}/themes/#{t}/style" })
      ie_links = stylesheet_link_tag("#{SexyButtons.pub_root}/ie")
      "#{links}\n<!--[if IE]>\n#{ie_links}\n<![endif]-->"
    end
    
    def sexy_button(value="Submit", options={})
      default_options = {
        :type => "submit",
        :value => value,
        :class => "sexy-button"
      }
      if options[:theme]
        theme = options.delete(:theme)
        default_options[:class] << " sexy-button-#{theme}"
      end
      if options[:class]
        options[:class] << " #{default_options[:class]}"
      end
      content_tag(:button, content_tag(:span, value), default_options.merge(options))
    end
    
    def sexy_link_to(name, options={}, html_options={})
      default_html_options = {
        :class => "sexy-button"
      }
      if html_options[:theme]
        theme = html_options.delete(:theme)
        default_html_options[:class] << " sexy-button-#{theme}"
      end
      if html_options[:class]
        html_options[:class] << " #{default_options[:class]}"
      end
      link_to(content_tag(:span, name), options, default_html_options.merge(html_options))
    end
    
  end
end