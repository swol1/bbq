source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.2'

gem 'twitter-bootstrap-rails'

gem 'uglifier', '>= 1.3.0'

gem 'jquery-rails'

gem 'devise'
gem 'devise-i18n'
gem 'rails-i18n'

gem 'rmagick'
gem 'carrierwave'
gem 'fog-aws'

gem 'simple_form'

gem 'bootsnap', '>= 1.1.0', require: false

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'listen'
end
