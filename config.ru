#require './my_sinatra'
#run Sinatra::Application
# модульный запуск
root = File.expand_path File.dirname(__FILE__)
require File.join( root, 'my_sinatra.rb')

#old
#app = Rack::Builder.app do
#  run MyAppModule::App
#end

#run app

run Sinatra::Application


