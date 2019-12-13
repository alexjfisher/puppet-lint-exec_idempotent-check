Gem::Specification.new do |spec|
  spec.name        = 'puppet-lint-exec_idempotent-check'
  spec.version     = '0.0.4'
  spec.homepage    = 'https://github.com/trlinkin/puppet-lint-exec_idempotent-check'
  spec.license     = 'Apache-2.0'
  spec.author      = 'Tom Linkin'
  spec.email       = 'trlinkin@gmail.com'
  spec.files       = Dir[
    'README.md',
    'LICENSE',
    'lib/**/*',
    'spec/**/*',
  ]
  spec.test_files  = Dir['spec/**/*']
  spec.summary     = 'A puppet-lint plugin to check for idepotency with exec resources.'
  spec.description = spec.summary

  spec.add_dependency             'puppet-lint', '>= 1.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'simplecov', '~> 0.15.0'
  spec.add_development_dependency 'rspec-its', '~> 1.0'
  spec.add_development_dependency 'rspec-collection_matchers', '~> 1.0'
  spec.add_development_dependency 'rake'
end
