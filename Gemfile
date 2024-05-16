# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read(".ruby-version").strip

gem "bootsnap", require: false # Reduces boot times through caching; required in config/boot.rb
gem "draper" # [https://github.com/arjes/draper]
gem "importmap-rails" # Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "jbuilder" # Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "kaminari" # [https://github.com/kaminari/kaminari]
gem "pg", "~> 1.5"
gem "puma", "~> 5.0" # Use the Puma web server [https://github.com/puma/puma]
gem "rails", "~> 7.0.3", ">= 7.0.3.1"
gem "redis", "~> 4.0" # Use Redis adapter to run Action Cable in production
gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem "stimulus-rails" # Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "tailwindcss-rails" # Use Tailwind CSS [https://github.com/rails/tailwindcss-rails]
gem "to_bool" # boolean parsing, useful for env vars [https://github.com/bricker/to_bool]
gem "turbo-rails" # Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem "bcrypt", "~> 3.1.7" Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "image_processing", "~> 1.2" Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "kredis" Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "sassc-rails" Use Sass to process CSS

group :development, :test do
  gem "bullet" # [https://github.com/abexsoft/ruby-bullet]
  gem "dockerfile-rails", ">= 1.6"
  gem "factory_bot_rails" # [https://github.com/thoughtbot/factory_bot_rails]
  gem "faker" # [https://github.com/faker-ruby/faker]
  gem "jazz_fingers" # [https://github.com/plribeiro3000/jazz_fingers]
  gem "pry" # [https://github.com/pry/pry]
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails"
  gem "rubocop"
  gem "rubocop-performance"
  gem "rubocop-rails"
  gem "rubocop-rspec"
end

group :development do
  gem "annotate" # [https://github.com/ctran/annotate_models]
  gem "better_errors" # [https://github.com/BetterErrors/better_errors]
  gem "binding_of_caller"
  gem "bundler-gtags", github: "jmromer/bundler-gtags" # [https://github.com/kayhide/bundler-gtags]
end

group :test do
  gem "apparition" # headless chromedriver [https://github.com/twalpole/apparition]
  gem "capybara" # acceptance testing [https://github.com/teamcapybara/capybara]
  gem "database_cleaner-active_record" # [https://github.com/DatabaseCleaner/database_cleaner]
  gem "database_cleaner-redis" # [https://github.com/DatabaseCleaner/database_cleaner-redis]
  gem "rails-controller-testing" # [https://github.com/rails/rails-controller-testing]
  gem "shoulda-matchers" # [https://github.com/thoughtbot/shoulda-matchers]
  gem "simplecov", require: false # [https://github.com/simplecov-ruby/simplecov]
  gem "simplecov-console", require: false
end
