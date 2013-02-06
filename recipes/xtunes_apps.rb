
prefs[:xtunes_apps] = multiple_choice "Install an example application?",
  [
    ["I want to build my own application", "none"],
    ["basic active_record website", "basic_active_record"],
    ["basic mongoid website", "basic_mongoid"]
  ] unless prefs.has_key? :xtunes_apps


case prefs[:xtunes_apps]
  when 'basic_active_record'
    prefs[:dev_webserver] = "webrick"
    prefs[:prod_webserver] = "same"
    prefs[:database] = "mysql"
    prefs[:templates] = "haml"
    prefs[:unit_test] = "rspec"
    prefs[:fixtures] = "factory_girl"
    prefs[:integration] = 'none'
    prefs[:frontend] = "none"
    prefs[:form_builder] = "none"
    prefs[:authorization] = "none"
    prefs[:quiet_assets] = true
    prefs[:local_env_file] = false
    prefs[:better_errors] = true
    prefs[:ban_spiders] = false
    prefs[:rvmrc] = false
    prefs[:github] = false
    prefs[:amalgam] = false
  when 'basic_mongoid'
    prefs[:dev_webserver] = "webrick"
    prefs[:prod_webserver] = "same"
    prefs[:database] = 'mongodb'
    prefs[:orm] = 'mongoid'
    prefs[:templates] = "haml"
    prefs[:unit_test] = "rspec"
    prefs[:fixtures] = "factory_girl"
    prefs[:integration] = 'none'
    prefs[:frontend] = "none"
    prefs[:form_builder] = "none"
    prefs[:authorization] = "none"
    prefs[:quiet_assets] = true
    prefs[:local_env_file] = false
    prefs[:better_errors] = true
    prefs[:ban_spiders] = false
    prefs[:rvmrc] = false
    prefs[:github] = false
    prefs[:amalgam] = false
end

__END__

requires: [xtunes]
category: collections