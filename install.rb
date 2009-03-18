puts "\n"
puts "* Installing 'SexyButtons' plugin"
FileUtils.cp_r("#{RAILS_ROOT}/vendor/plugins/sexy_buttons/public/stylesheets/sexy_buttons", "#{RAILS_ROOT}/public/stylesheets/sexy_buttons")
puts "+ Stylesheets and themes copied to /public/stylesheets/sexy_buttons"
puts "+ Plugin installed. Visit http://github.com/vlado/sexy_buttons for more info."
puts "\n"