class AssetCopierGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.directory "vendor/plugins/#{file_name}/tasks"

      m.template "init.erb", "vendor/plugins/#{file_name}/init.rb"
      m.template "install.erb", "vendor/plugins/#{file_name}/install.rb"
      m.template "asset_copier.erb", "vendor/plugins/#{file_name}/tasks/asset_copier.rake"

      m.file "asset_copier.rb", "vendor/plugins/#{file_name}/lib/asset_copier.rb"
      m.file "deleted_files", "vendor/plugins/#{file_name}/deleted_files"
    end
  end
end