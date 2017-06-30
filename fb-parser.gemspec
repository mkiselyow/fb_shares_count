Gem::Specification.new do |spec|
  spec.files         = Dir["{bin,lib,db}/**/*", "LICENSE", "README.md"] + Dir['tasks/*.rake']
  # spec.test_files    = Dir["spec/**/*"]
  spec.name           = "fb-parser"
  spec.version        = "0.1.1"
  spec.summary        = "test"
  spec.author         = "Webinar LTD"

  spec.require_paths  = ["lib"]
  # spec.executables    = ["meter"]
end