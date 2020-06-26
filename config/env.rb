ENV["APP_ENV"] ||= "development"

require "bundler/setup"
require "carrierwave"
require 'carrierwave/orm/activerecord'

Bundler.require(:default, ENV["APP_ENV"])

configure :development do
    set :database, {adapter: 'sqlite3', database: 'db/db.sqlite3'}
end

require_all 'app'

# ActiveRecord::Base.establish_connection(
#   :adapter => "sqlite3",
#   :database => "db/#{ENV['APP_ENV']}.sqlite"
# )

#Configure Carrierwave
CarrierWave.configure do |config|
    config.root = File.dirname(__FILE__) + "/public"
  end
  
  Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
  Dir[File.join(File.dirname(__FILE__), "../app/controllers", "*.rb")].each {|f| require f}