Gem::Specification.new do |s|
  s.name = 'capistrano-deepmodules'
  s.version = "0.2"
  s.date     = "2009-03-01"
  s.summary = "Capistrano plugin to deploy Git repos with nested submodules."
  s.description = %{This plugin allows you to easily deploy git repositories with
    the submodules nested at more then one level.%}

  s.has_rdoc = false
  
  s.files = ['lib/capistrano/deepmodules.rb',
    'capistrano-deepmodules.gemspec',
    'README'
  ]

  s.require_path = 'lib'

  s.author = "Oleg Ivanov"
  s.email = "morhekil@morhekil.net"
  s.homepage = "http://github.com/morhekil/capistrano-deepmodules"
  s.rubyforge_project = 'capistrano-deepmodules'
end
