class SexyButtonsGenerator < Rails::Generator::NamedBase
  
  def manifest
    record do |m|
      case name
      when "assets"
        themes = Dir.entries("#{RAILS_ROOT}/vendor/plugins/sexy_buttons/generators/sexy_buttons/templates/assets/themes").delete_if { |f| f.match(/^\./) }
        theme_files = ["style.css", "bg.png"]
        m.directory "public/stylesheets/sexy_buttons"
        m.file "assets/style.css", "public/stylesheets/sexy_buttons/style.css"
        m.directory "public/stylesheets/sexy_buttons/themes"
        themes.each do |theme|
          m.directory "public/stylesheets/sexy_buttons/themes/#{theme}"
          theme_files.each do |file_name|
            m.file "assets/themes/#{theme}/#{file_name}", "public/stylesheets/sexy_buttons/themes/#{theme}/#{file_name}"
          end
        end
        logger.info "Copying sexy buttons assets to public/stylesheets/sexy_buttons"
      when "theme"
        theme_name = args[0]
        m.directory "public/stylesheets/sexy_buttons/themes/#{theme_name}"
        m.template "theme/style.css.erb", "public/stylesheets/sexy_buttons/themes/#{theme_name}/style.css", :assigns => { :theme_name => theme_name, :font_size => args[1], :height => args[2] }
      end
    end
  end

end