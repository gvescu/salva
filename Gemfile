# Edit this Gemfile to bundle your application"s dependencies.
source 'https://rubygems.org'

ruby '2.7.6'

gem 'rails', '~> 6.1.7'
gem "haml"
gem "show_for"
gem "simple_form"
gem "barista"
# gem "blueprint-rails"
gem "rails-i18n"
gem 'net-http'

# Authorization
gem "cancancan"

# Authentication
gem "devise"
gem "bcrypt"
gem "devise-encryptable"
gem "devise_ldap_authenticatable"
gem "devise-i18n"
gem "net-ldap"
gem "iconv"

# Searching and tagging
gem "tsearch", :require => "texticle"
gem "scope_by_fuzzy", :git => "https://github.com/monsterlabs/scope_by_fuzzy.git"

# Control version
gem "simple-navigation"
gem "paper_trail"
gem "diff"

# Misc
gem "carrierwave"
gem "rmagick"
gem 'kaminari', '~> 1.2.2'
gem 'kaminari-i18n', '~> 0.5.0'
gem "attribute_normalizer"
gem "inherited_resources"
gem "pg"
gem "meta_search"
# gem "squeel"

#Graphs
gem "lazy_high_charts"

# Asset Pipeline
gem "sassc"
gem "json"
gem "coffee-script"
gem "uglifier"
gem "css_image_embedder"
gem "sass-rails"
gem "compass-rails31"

gem "by_star"
gem "tzinfo"

# gem "SystemTimer"
gem "redis"
gem "redis-namespace"
gem 'resque', '~> 1.19'
gem 'resque-status', '~> 0.5.0'
gem 'resque_mailer', '~> 2.4.3'

gem "prawn"
gem "prawn_rails"
gem "spreadsheet"
gem "barby"
gem "RedCloth"
gem "rtf"
gem "rtf_rails"
gem "jquery-rails"
gem "rest-client"
# gem "secure_headers", "~> 1.0.0"

# Rails Admin
gem 'activeadmin', '~> 2.13.1'
gem 'fastercsv', '~> 1.5.5'
gem 'rails_admin', '~> 3.1.0'

# Database seeds
gem 'highline', '~> 2.0.3'

group :production do
  gem "rack-ssl-enforcer"
  gem 'capistrano', '~> 2.15.4'
  gem 'rvm-capistrano', '~> 1.5.6'
  gem "execjs"
  gem "therubyracer"
  gem "exception_notification"
  gem "octopi"
  gem "dalli"
end

group :development do
  gem "hpricot"
  gem "ruby_parser"
  gem "unicorn"
  gem "pry-rails"
end

group :test do
  gem 'forgery', '~> 0.8.1'
  gem 'machinist', '~> 2.0'
  gem 'remarkable', '>= 4.0.0.alpha4'
  gem 'remarkable_activemodel', '>= 4.0.0.alpha4'
  gem 'remarkable_activerecord', '>= 4.0.0.alpha4'
  gem 'rspec-rails', '~> 6.0.1'
  gem 'steak', '~> 2.0.0'
end
