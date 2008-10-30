Gem::Specification.new do |s|
  s.name = 'capistrano-deepmodules'
  s.version = "0.1"
  s.date     = "2008-10-28"
  s.summary = "Capistrano plugin to deploy Git repos with nested submodules."
  s.description = %{This plugin allows you to easily deploy git repositories with
  submodules nested at more then one level.%}
  s.has_rdoc = false
  
  s.files = ['lib/capistrano/deepmodules.rb',
    'capistrano-deepmodules.gemspec',
    'README'
  ]

  s.require_path = 'lib'

  s.author = "Oleg Ivanov"
  s.email = "morhekil@morhekil.net"
  s.homepage = "http://speakmy.name"
  s.rubyforge_project = 'capistrano-deepmodules'
end
