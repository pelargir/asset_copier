class AssetCopierGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.directory "vendor/plugins/#{file_name}/tasks"
      m.directory "vendor/plugins/#{file_name}/lib/#{file_name}"
      
      m.template "init.rb.erb", "vendor/plugins/#{file_name}/init.rb"
      m.template "install.rb.erb", "vendor/plugins/#{file_name}/install.rb"
      m.template "asset_copier.rake.erb", "vendor/plugins/#{file_name}/tasks/asset_copier.rake"
      m.template "asset_copier.rb.erb", "vendor/plugins/#{file_name}/lib/#{file_name}/asset_copier.rb"
      
      m.file "deleted_files", "vendor/plugins/#{file_name}/deleted_files"
    end
  end
end