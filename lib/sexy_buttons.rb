module SexyButtons
  
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
    
  end
  
end