source 'https://rubygems.org'

git "git://github.com/middleman/middleman.git", :branch => "3.0-stable" do
  # gem "middleman"
  gem "middleman-core"
  # gem "middleman-more"
end

# Specify your gem's dependencies in middleman-blog.gemspec
gemspec

group :development do
  gem "rake",     "~> 0.9.2"
  gem "rdoc",     "~> 3.9"
  gem "yard",     "~> 0.8.0"
end

group :test do
  gem "cucumber", "~> 1.2.0"
  gem "fivemat"
  gem "rspec",    "~> 2.7"
end
