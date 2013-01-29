
gem 'xtunes_helpers', :git => 'git@github.com:xtunes/xtunes_helpers.git'


after_bundler do

  say_wizard "Cleanup recipe running 'after bundler'"

  # remove unnecessary files
  %w{
    README.rdoc
    doc/README_FOR_APP
    public/index.html
    app/assets/images/rails.png
  }.each { |file| remove_file file }

  # remove commented lines and multiple blank lines from Gemfile
  # thanks to https://github.com/perfectline/template-bucket/blob/master/cleanup.rb
  gsub_file 'Gemfile', /#.*\n/, "\n"
  gsub_file 'Gemfile', /\n^\s*\n/, "\n"

  # remove commented lines and multiple blank lines from config/routes.rb
  gsub_file 'config/routes.rb', /  #.*\n/, "\n"
  gsub_file 'config/routes.rb', /\n^\s*\n/, "\n"

  # add locate info into application.rb
  inject_into_file 'config/application.rb', :after => "Rails::Application\n" do
    <<-RUBY
    config.time_zone = 'Beijing'
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**' ,'*.{rb,yml}').to_s]
    config.i18n.default_locale = "zh-CN"
    Time::DATE_FORMATS.merge!(:default => "%Y/%m/%d %H:%M:%S", :ymd => "%Y/%m/%d")
\n
    RUBY
  end
  # add localize file
  empty_directory 'config/locales/rails'
  get "https://raw.github.com/svenfuchs/rails-i18n/master/rails/locale/zh-CN.yml", "config/locales/rails/zh-CN.yml"
end


__END__

name: xtunes_extras
description: "Adding xtunes_extras to your application"
author: xtunes

category: other
requires: [setup]
run_after: [setup, extras]