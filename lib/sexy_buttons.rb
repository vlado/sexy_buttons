module SexyButtons
  
  @@default_theme = "default"
  @@public_url = "/stylesheets/sexy_buttons"
  @@public_root = "#{RAILS_ROOT}/public#{@@public_url}"
  
  class << self
    
    # root url with sexy buttons resources
    def public_url
      @@public_url
    end
    
    # root dir where sexy buttons resources are placed
    def public_root
      @@public_root
    end
    
    def default_theme
      @@default_theme
    end
    
    def default_theme=(theme)
      @@default_theme = theme
    end
    
  end
  
end