ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

  configure :development do
    set :database, 'sqlite3:db/database.db'
  end


require_relative "../app/controllers/application_controller.rb"

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../app/controllers", "*.rb")].sort.each {|f| require f}