require 'rake'
 
begin
  puts "=========================================================="
  puts "Attempting to copy required files into your application..."
  puts "=========================================================="
  RAKE_FILE = File.join(File.dirname(__FILE__), '/tasks/asset_copier.rake')
  load RAKE_FILE
  
  Rake::Task['asset_copier:copy'].invoke
  puts "=========================================================="
  puts "Success!"
  puts "=========================================================="
rescue Exception => ex
  puts "FAILED TO COPY FILES DURING INSTALL.  PLEASE RUN rake asset_copier:copy."
  puts "EXCEPTION: #{ex}"
end