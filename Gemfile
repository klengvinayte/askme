source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem 'font-awesome-rails'

gem 'email_validator'

gem 'gravtastic'

gem "rails", "~> 7.0.4"

gem "sprockets-rails"

gem "puma", "~> 5.0"

gem "importmap-rails"

gem "turbo-rails"

gem "stimulus-rails"

gem "jbuilder"

gem "bcrypt", "~> 3.1.7"


gem "bootsnap", require: false


group :production do
  gem "pg"
end

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]

  gem "sqlite3", "~> 1.4"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
