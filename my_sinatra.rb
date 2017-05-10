#запросы API
require 'sinatra'
require 'sinatra/namespace'

module MyAppModule
  class App < Sinatra::Base
    register Sinatra::Namespace

    #переадресация
    get '/' do
      #'Hello My Sinatra - Easy and '
      redirect to('hello/world')
    end

    #get "/hello/:name" do
    #  "Sinatra приветствует тебя, #{params[:name]}!"
    #end

    #можно использовать регвыражения в запросах
    get %r{/hello/([\w]+)} do |c|
      "Hello, #{c}!"
    end

    #можно использовать маску splat
    #get "/*" do
    #  "I know #{params[:splat]}."
    #end

    get '/say/*/to/*' do

    end

    namespace '/api/v1' do
      get '/*' do
        "I dont find #{params[:splat]}"
      end
    end

  end
end

