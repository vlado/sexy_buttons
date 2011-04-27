module SexyButtons
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a SexyButtons initializer"

      def copy_initializer
        template "initializer.rb", "config/initializers/sexy_buttons.rb"
      end
      
      def copy_assets
        directory "assets", "public/stylesheets/sexy_buttons"
      end
      
    end
  end
end