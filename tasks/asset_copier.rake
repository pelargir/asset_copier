require 'find'
 
class AssetCopier
  def self.copy_all
    # TODO
  end
end
 
namespace :asset_copier do
  desc "Copy all managed assets to the project"
  task :copy_all do  
    AssetCopier.copy_all
  end
end
