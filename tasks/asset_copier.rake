require 'find'
 
class AssetCopier
  @source = File.expand_path(File.join(File.dirname(__FILE__), '..', 'files'))
  @destination = RAILS_ROOT
  class << self 
    attr_accessor :source, :destination
  end
  
  def self.copy
    paths.each do |path| 
      dest_path = path.gsub(source, destination)
      if File.directory?(path)
        FileUtils.mkdir_p(dest_path) unless File.exists?(dest_path)
      else
        FileUtils.cp(path, dest_path)
      end
    end
  rescue Exception => e
    puts "Error trying to copy files: #{e.inspect}"
    raise e
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
 
namespace :asset_copier do
  desc "Copy all managed assets to the project"
  task :copy do  
    AssetCopier.copy
  end
end
