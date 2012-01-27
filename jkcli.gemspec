Gem::Specification.new do |spec|
  spec.name        = "jkcli"
  spec.version     = "0.1.0"
  spec.date        = %q{2012-01-26}
  spec.summary     = "Jenkins command line interface"
  spec.authors     = ["Vivien Barousse"]
  spec.email       = "barousse.vivien@gmail.com"
  spec.files       = Dir["lib/**/*.rb"]
  spec.test_files  = Dir["spec/**/*spec*.rb"]
  spec.extra_rdoc_files = ["README"]
  spec.description = <<-EOF
    Command line interface for Jenkins
  EOF

  spec.executables << 'jkcli'

  spec.add_dependency("rest-client")
  spec.add_dependency("json")
  spec.add_development_dependency("rspec")
end
