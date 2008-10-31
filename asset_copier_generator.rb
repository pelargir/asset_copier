class AssetCopierGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.directory "vendor/plugins/#{file_name}/tasks"
      m.file "install.erb", "vendor/plugins/#{file_name}/install.rb"
      m.template "asset_copier.erb", "vendor/plugins/#{file_name}/tasks/asset_copier.rake"
      m.file "asset_copier.rb", "vendor/plugins/#{file_name}/lib/asset_copier.rb"
    end
  end
end