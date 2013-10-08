require 'rubygems'
require 'sinatra'
require 'sinatra/base'

class Codelitt < Sinatra::Base
  
  get '/' do
    slim :index
  end

run! if app_file == $0 
end
