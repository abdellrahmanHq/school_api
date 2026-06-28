source "https://rubygems.org"

ruby "3.3.3"

gem "rails", "~> 7.2.3", ">= 7.2.3.1"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "bcrypt", "~> 3.1.7"
gem "jwt"
gem "rack-cors"
gem "bootsnap", require: false
gem "tzinfo-data"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end