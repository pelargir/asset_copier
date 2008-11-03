# Generated by the asset_copier plugin
# http://github.com/pelargir/asset_copier

require 'find'
require 'digest/md5'

class AssetCopier
  @source = File.expand_path(File.join(File.dirname(__FILE__), '..', 'files'))
  @destination = RAILS_ROOT
  @deleted_files = File.expand_path(File.join(File.dirname(__FILE__), '..', 'deleted_files'))
  class << self
    attr_accessor :source, :destination, :deleted_files, :plugin_name
  end
  
  def self.copy(plugin_name)
    self.plugin_name = plugin_name
    begin
      paths.each do |path| 
        dest_path = path.gsub(source, destination)
        if File.directory?(path)
          unless File.exists?(dest_path)
            FileUtils.mkdir_p(dest_path)
            puts "Creating directory #{dest_path}"
          end
        else
          FileUtils.cp(path, dest_path)
          puts "Copying #{dest_path}"
        end
      end
    rescue Exception => e
      puts "Error trying to copy files: #{e.inspect}"
      raise e
    end
    print_deletion_warnings
  end
  
  def self.warn(plugin_name)
    self.plugin_name = plugin_name
    paths.each do |path| 
      dest_path = path.gsub(source, destination)
      if File.directory?(path)
        puts "WARNING: Directory #{dest_path} is required by the #{plugin_name} " <<
          "plugin but does not exist" unless File.exists?(dest_path)
      else
        if File.exists?(dest_path)
          puts "WARNING: #{dest_path} is out of date and needs to be reinstalled " <<
            "from the #{plugin_name} plugin" unless compare(path, dest_path)
        else
          puts "WARNING: #{dest_path} is missing and needs to be installed " <<
            "from the #{plugin_name} plugin"
        end
      end
    end
    print_deletion_warnings
  end
  
  def self.compare(file1, file2)
    Digest::MD5.hexdigest(File.read(file1)) == Digest::MD5.hexdigest(File.read(file2))
  end
  
  def self.print_deletion_warnings
    File.open(deleted_files, "r") do |f|
      f.readlines.reject { |l| l =~ /^#/ || l.strip.blank? }.each do |l|
        puts "WARNING: #{l} is no longer required by the #{plugin_name} plugin " <<
          "and can can be safely removed" if File.exists?(l)
      end
    end
  end
  
  def self.paths
    paths = []
    Find.find(source) do |path|
      Find.prune if path =~ /\/\..+/
      Find.prune if path =~ /(CVS|.svn|.git)/
      paths << path
    end
    paths
  end
end
