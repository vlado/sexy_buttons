module SexyButtons
  module ViewHelpers
    
    # Returns a stylesheet link tags for the sexy button styles
    # 
    # Provide themes you want to load. For example this will load themes "one", "two", "theme_three"
    #
    #   sexy_buttons_stylesheet_link_tag "one", "two", "theme_three"
    #
    # If you want to load all themes from public/stylesheets/sexy_buttons/themes dir use <tt>:all</tt> as themes
    #
    #   sexy_buttons_stylesheet_link_tag :all
    #
    # If you ommit themes only default theme will be loaded
    #
    # See http://api.rubyonrails.org/classes/ActionView/Helpers/AssetTagHelper.html#M001687 for more info
    def sexy_buttons_stylesheet_link_tag(*themes)
      if themes.first.to_s == "all"
        themes = Dir.entries("#{SexyButtons.public_root}/themes").delete_if { |e| !File.directory?("#{SexyButtons.public_root}/themes/#{e}") or e.match(/^\./) }
      end
      themes.delete(SexyButtons.default_theme)
      themes.unshift(SexyButtons.default_theme)
      themes = themes.collect { |t| "#{SexyButtons.public_url}/themes/#{t}/style" }
      themes.unshift("#{SexyButtons.public_url}/style")
      links = stylesheet_link_tag(*themes)
    end
    
    # Returns styled <tt>button</tt> tag
    #
    # To use specific theme use <tt>:theme</tt> options
    #
    #   sexy_button "Click Me", :theme => "my-theme"
    #
    # For theme to work, you must add theme to public/stylesheets/sexy_buttons/themes first
    def sexy_button(value="Submit", options={})
      default_options = {
        :type => "submit",
        :value => value,
        :class => "sexy-button"
      }
      if options[:theme] or SexyButtons.default_theme != "default"
        theme = options[:theme] ? options.delete(:theme) : SexyButtons.default_theme
        default_options[:class] << " sexy-button-#{theme}"
      end
      if options[:class]
        options[:class] << " #{default_options[:class]}"
      end
      content_tag(:button, "<span>#{value}</span>", default_options.merge(options))
    end
    
    # Returens styled <tt>a</tt> tag
    #
    # themes are selected similar to sexy_button method
    # 
    #   sexy_link_to "Click here", "/my_url", :theme => "my-theme"
    def sexy_link_to(name, options={}, html_options={})
      default_html_options = {
        :class => "sexy-button"
      }
      if html_options[:theme] or SexyButtons.default_theme != "default"
        theme = html_options[:theme] ? html_options.delete(:theme) : SexyButtons.default_theme
        default_html_options[:class] << " sexy-button-#{theme}"
      end
      if html_options[:class]
        html_options[:class] << " #{default_options[:class]}"
      end
      link_to("<span>#{name}</span>", options, default_html_options.merge(html_options))
    end
    
  end
end