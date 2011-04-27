module SexyButtons
  module Generators
    class SexyButtonsGenerator < Rails::Generators::NamedBase
      namespace "sexy_buttons"
      source_root File.expand_path("../../templates", __FILE__)

      desc "Generates a theme styles with the given NAME. You will need to add image manually"
      
      argument :theme_name
      argument :font_size
      argument :height
      
      def theme
        empty_directory "public/stylesheets/sexy_buttons/themes/#{theme_name}"
        template "style.css.erb", "public/stylesheets/sexy_buttons/themes/#{theme_name}/style.css"
      end
      
    end
  end
end
