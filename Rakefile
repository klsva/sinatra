require 'sinatra'
require './lib/tasks/db'

namespace :db do
  task :environment do
    require 'sequel'
    ENV['DATABASE_URL'] ||= 'postgres://lena:password@localhost/sin'
    ENV['RACK_ENV'] ||= 'development'
    ENV['DATABASE'] = 'sin_dev' if ENV['RACK_ENV'] == 'development'
    ENV['DATABASE'] = 'sin_test' if ENV['RACK_ENV'] == 'test'
    ENV['DATABASE'] = 'sin_prod' if ENV['RACK_ENV'] == 'production'
  end
end
