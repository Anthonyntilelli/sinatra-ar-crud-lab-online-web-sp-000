require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # Create
  # end  get '/' do

  
  get '/articles/new' do
    @article = article.new
    erb :new
  end
  
  # post '/articles' do
  # end
  
end
