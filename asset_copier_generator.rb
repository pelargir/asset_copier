class AssetCopierGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.file "install.rb", "vendor/plugins/#{file_name}/install.rb"
      m.file "asset_copier.rake", "vendor/plugins/#{file_name}/tasks/asset_copier.rake"
    end
  end
end