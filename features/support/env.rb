require 'rubygems'

ENV["RAILS_ENV"] ||= "test"

 # Have all rests run with english browser locale
ENV['LANG'] = 'C'

require 'cucumber/rails'

require 'capybara/rails'
require 'capybara/cucumber'
require 'capybara/session'
#require 'cucumber/rails/capybara_javascript_emulation' # Lets you click links with onclick javascript handlers without using @culerity or @javascript

# Ensure we know the appservers port
Capybara.server_port = 9887


# Capybara defaults to XPath selectors rather than Webrat's default of CSS3. In
# order to ease the transition to Capybara we set the default here. If you'd
# prefer to use XPath just remove this line and adjust any selectors in your
# steps to use the XPath syntax.
Capybara.default_selector = :css

# We have a ridiculously high wait time to account for build machines of various beefiness.
# Capybara.default_wait_time = 30

# While there are a lot of failures, wait less, avoiding travis timeout
Capybara.default_wait_time = 15

# If you set this to false, any error raised from within your app will bubble
# up to your step definition and out to cucumber unless you catch it somewhere
# on the way. You can make Rails rescue errors and render error pages on a
# per-scenario basis by tagging a scenario or feature with the @allow-rescue tag.
#
# If you set this to true, Rails will rescue all errors and render error
# pages, more or less in the same way your application would behave in the
# default production environment. It's not recommended to do this for all
# of your scenarios, as this makes it hard to discover errors in your application.
ActionController::Base.allow_rescue = false

require 'database_cleaner'
require 'database_cleaner/cucumber'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.orm = "active_record"
Cucumber::Rails::World.use_transactional_fixtures = false

require File.join(File.dirname(__FILE__), "integration_sessions_controller")
require File.join(File.dirname(__FILE__), "poor_mans_webmock")

require 'sidekiq/testing/inline'

require Rails.root.join('spec', 'helper_methods')
require Rails.root.join('spec', 'support', 'inlined_jobs')
require Rails.root.join('spec', 'support', 'user_methods')
include HelperMethods

# require 'webmock/cucumber'
# WebMock.disable_net_connect!(:allow_localhost => true)

Before do
  Devise.mailer.deliveries = []
end
