source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'bootsnap', '>= 1.1.0', require: false

gem 'carrierwave'

gem 'devise'
gem 'devise-i18n'

gem 'fog-aws'

gem 'jquery-rails'

gem 'rails_admin'

gem 'rails', '~> 5.2.2'

gem 'rails-i18n'

gem 'rmagick'

gem 'simple_form'

gem 'twitter-bootstrap-rails'

gem 'uglifier', '>= 1.3.0'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers', '4.0.0.rc1'
  gem 'rails-controller-testing'

  gem 'sqlite3', '~> 1.3.13'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'listen'
end
