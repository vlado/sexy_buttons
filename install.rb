puts "\n"
puts "* Installing 'SexyButtons' plugin"
if File.exist?("#{RAILS_ROOT}/public/stylesheets/sexy_buttons")
  puts "! Directory '#{RAILS_ROOT}/public/stylesheets/sexy_buttons' already exists. You can manualy copy (update) resources from '#{RAILS_ROOT}/vendor/plugins/sexy_buttons/public/stylesheets/sexy_buttons'."
else
  FileUtils.cp_r("#{RAILS_ROOT}/vendor/plugins/sexy_buttons/public/stylesheets/sexy_buttons", "#{RAILS_ROOT}/public/stylesheets/sexy_buttons")
  puts "+ Stylesheets and themes copied to /public/stylesheets/sexy_buttons"
end
puts "+ Plugin installed. Visit http://github.com/vlado/sexy_buttons for more info."
puts "\n"