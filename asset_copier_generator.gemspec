Gem::Specification.new do |s|
  s.name     = "asset_copier_generator"
  s.version  = "0.5"
  s.date     = "2008-10-30"
  s.summary  = "Intelligent asset management for Rails plugins."
  s.email    = "pelargir@gmail.com"
  s.homepage = "http://github.com/pelargir/asset_copier"
  s.description = "Intelligent asset management for Rails plugins."
  s.has_rdoc = true
  s.authors  = ["Matthew Bass"]
  s.files    = [
    "asset_copier_generator.rb",
    "CHANGELOG",
    "MIT-LICENSE",
    "Rakefile",
    "README",
    "templates/asset_copier.rake",
    "templates/install.rb",
    "TODO",
    "USAGE",
		"asset_copier_generator.gemspec"
		]
  s.rdoc_options = ["--main", "README"]
  s.extra_rdoc_files = ["README"]
end