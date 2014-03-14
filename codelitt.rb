require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/assetpack'
require 'slim'
class Codelitt < Sinatra::Base
  set :root, File.dirname(__FILE__)

  register Sinatra::AssetPack

  enable :inline_templates

  assets do
    serve '/js',     from: 'app/js'        # Default
    serve '/css',    from: 'app/css'       # Default
    serve '/images', from: 'app/images'    # Default

    css :cssapp, [
      '/css/*.css',
    ]
              
    js :jsapp, [
      '/js/*.js'
    ]
            
    css_compression :simple
    js_compression :jsmin
  end
              
                                                 
  get '/' do
    slim :index
  end

  get '/technologies' do
    slim :technologies
  end

  get '/services' do
    slim :services
  end

  get '/contact' do
    slim :contact
  end

  get(/.+/) do
    send_sinatra_file(request.path) {404}
  end
  
  not_found do
    send_file(File.join(File.dirname(__FILE__), 'public', '404.html'), {:status => 404})
  end

  def send_sinatra_file(path, &missing_file_block)
    file_path = File.join(File.dirname(__FILE__), 'public',  path)
    file_path = File.join(file_path, 'index.html') unless file_path =~ /\.[a-z]+$/i
    File.exist?(file_path) ? send_file(file_path) : missing_file_block.call
  end 

run! if app_file == $0 
end
