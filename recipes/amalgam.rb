if config['amalgam']
  prefs[:amalgam] = true
end

if prefs[:amalgam]
  gsub_file "Gemfile", /gem 'jquery-rails'/, "gem 'jquery-rails', '2.0.2'"

  gem 'amalgam', :path => '/Users/brownjohn/code/amalgam'
  gem 'anjlab-bootstrap-rails', '~> 2.0.3' , :require => 'bootstrap-rails'
  gem 'mercury-rails', '~> 0.8.0'
  gem 'nested_set', "~> 1.7.0"
  gem 'modernizr-rails'
  gem 'jquery-ui-rails'
  gem "remotipart", '~> 1.0'
  gem 'bcrypt-ruby', '~> 3.0.0'
  gem 'carrierwave', "~> 0.6.2"
  gem 'mini_magick'
  gem 'kaminari'
  gem 'globalize3'
end

after_everything do
  # This block is run after the 'after_bundler' block.
  # Use this section to finalize the application.
  # Run database migrations or make a final git commit.
  generate 'amalgam:install' if prefs[:amalgam]
end

__END__

name: amalgam
description: "Adding amalgam to your application"
author: xtunes

category: collections
requires: [git, setup, gems, testing, extras]

config:
  - amalgam:
      type: boolean
      prompt: Add amalgam module