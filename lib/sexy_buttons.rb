module SexyButtons
  
  @@pub_root = "/stylesheets/sexy_buttons"
  @@pub_dir = "#{RAILS_ROOT}/public#{@@pub_root}"  
  
  class << self
    
    def pub_root
      @@pub_root
    end
    
    def pub_dir
      @@pub_dir
    end
    
  end
  
end