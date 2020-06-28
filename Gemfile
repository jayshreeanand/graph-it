source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Stack
gem 'rails', '~> 6.0.0'
gem 'pg'
gem 'puma', '~> 3.11'
gem 'foreman'

# Views
gem 'sass-rails', '~> 5'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'feathericon-sass'

# Auth
gem 'devise'

# Uploads
gem 'carrierwave_direct'
gem 'carrierwave-video'
gem 'carrierwave_backgrounder', github: 'jayshreeanand/carrierwave_backgrounder'
gem 'fog-aws'
gem 'dropzonejs-rails'

# Image manipulation
gem 'mini_magick'

# Background Processing
gem 'resque'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
