require 'fileutils'
PUBLIC_PATH = File.expand_path(File.join(RAILS_ROOT, "public"))
PLUGIN_PATH = File.expand_path(File.join(RAILS_ROOT,"vendor/plugins/sexy_buttons"))

namespace :sexy_buttons do
  
  desc 'Installs all the files for the buttons'
  task :install do
    public_icon_path = File.join(PUBLIC_PATH,"images","icons")
    public_css_path = File.join(PUBLIC_PATH,"stylesheets")
    icons = Dir.glob(File.join(PLUGIN_PATH,"images","famfamfam","*.png"))
    css = Dir.glob(File.join(PLUGIN_PATH,"css","*.css"))
    
    Dir.mkdir public_icon_path
    
    FileUtils.cp_r(icons,public_icon_path)
    FileUtils.cp_r(css, public_css_path)
    
    puts "All Sexy Button files have been installed!"
    puts "------------------------------------------"
    puts "just <%= bring_sexy_back %> in the head of"
    puts "your document..."
    puts "------------------------------------------"
    
  end
  
end
