class SexyButtonsGenerator < Rails::Generator::NamedBase
  
  def manifest
    record do |m|
      case name
      when "theme"
        theme_name = args[0]
        m.directory "public/stylesheets/sexy_buttons/themes/#{theme_name}"
        m.template "style.css.erb", "public/stylesheets/sexy_buttons/themes/#{theme_name}/style.css", :assigns => { :theme_name => theme_name, :font_size => args[1], :height => args[2] }
      end
    end
  end

end