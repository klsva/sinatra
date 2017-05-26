#запросы API
require 'sinatra'
require 'sinatra/base'
require 'sinatra/namespace'

#new
require 'sequel'
require 'sequel/extensions/seed'
require 'pg'
require 'json'
require 'multi_json'


#подключение к ДБ
DB = Sequel.connect(
    adapter: :postgres,
    database: 'sin_dev',
    host: 'localhost',
    password: 'password',
    user: 'lena',
    max_connections: 10,
# logger: Logger.new('log/db.log')
)

%w{ controllers models routes }.each{ |dir| Dir.glob("./#{ dir }/*.rb",&method(:require )) }

before do
  content_type 'application/json'
end

#корневой маршрут
get '/' do
  'Hello My Sinatra - Easy and '
  redirect to('hello/world')
end

def collection_to_api(collection)
  MultiJson.dump(collection.map{ |s| s.to_api })
end

#Sequel::Seed.setup :development # Set the environment
#Sequel.extension :seed # Load the extension
#Sequel::Seeder.apply(DB, './seeds') # Apply the seeds/fixtures




#old
#module MyAppModule
#  class App < Sinatra::Base
#    register Sinatra::Namespace

    #переадресация
#    get '/' do
      #'Hello My Sinatra - Easy and '
#      redirect to('hello/world')
#    end

    #get "/hello/:name" do
    #  "Sinatra приветствует тебя, #{params[:name]}!"
    #end

    #можно использовать регвыражения в запросах
 #   get %r{/hello/([\w]+)} do |c|
 #     "Hello, #{c}!"
 #   end

    #можно использовать маску splat
    #get "/*" do
    #  "I know #{params[:splat]}."
    #end

  #  get '/say/*/to/*' do

   # end

  #  get '/jobs.?:format?' do
      # соответствует "GET /jobs", "GET /jobs.json", "GET /jobs.xml" и т.д.
   #   'Да, работает этот маршрут!'
   # end

 #   namespace '/api/v1' do
  #    get '/*' do
   #     "I dont find #{params[:splat]}"
   #   end
 #   end

#  end
#end

