module SexyButtons
  
  @@default_theme = "default"
  @@public_url = "/stylesheets/sexy_buttons"
  @@public_root = "#{Rails.root}/public#{@@public_url}"
  
  class << self
    
    # root url with sexy buttons resources
    def public_url
      @@public_url
    end
    
    def public_url=(url)
      @@public_url = url
    end
    
    # root dir where sexy buttons resources are placed
    def public_root
     "#{Rails.root}/public#{@@public_url}"
    end
    
    def default_theme
      @@default_theme
    end
    
    def default_theme=(theme)
      @@default_theme = theme
    end
    
  end
  
end