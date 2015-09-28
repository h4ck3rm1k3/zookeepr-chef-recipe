source 'https://rubygems.org'

def dev_gem(name, path: File.join('..', name), github: nil)
  path = File.expand_path(File.join('..', path), __FILE__)
  if File.exist?(path)
    gem name, path: path
  elsif github
    puts "Adding \"../../cbsources/#{name}\""
    gem name, path: "../../cbsources/#{name}"
    #gem name, github: github
  else
    puts "Adding fallback '../../cbsources/#{name}'"
    gem name, path: "../../cbsources/#{name}"

  end
end

#gem 'poise-application-git', path: '../application_git'
#gem 'python', path: '../python'
#gem 'rspec'
dev_gem 'ridley'
dev_gem 'berkshelf'
dev_gem 'faraday'
dev_gem 'faraday_middleware'
dev_gem 'buff-config'
gem 'bundler'
gem 'zip'
gem 'chef', path: '../../cbsources/chef'
gem 'chefspec'
gem 'dep-selector-libgecode'
gem 'dep_selector'
gem 'foodcritic'
gem 'kitchen-vagrant'
gem 'poise-application', path:  '../../cbsources/application'
gem 'poise-application-python', path: '../../cbsources/application_python'
gem 'poise-application-git', path: '../../cbsources/application_git'
gem 'rake'
gem 'rspec', path: '../../cbsources/rspec'
gem 'rspec-core', path: '../../cbsources/rspec-core'
gem 'rspec-expectations', path: '../../cbsources/rspec-expectations'
gem 'rspec-mocks', path: '../../cbsources/rspec-mocks'
gem 'rspec-support', path: '../../cbsources/rspec-support'
gem 'rubocop'
gem 'test-kitchen'
gem 'vagrant', path: '../../cbsources/vagrant'
gem 'yard'
