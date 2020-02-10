require_relative '../../config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # GETS
  # get '/' do
  #   redirect "/articles"
  # end

  get "/articles/new" do
    @article = Article.new
    erb :new
  end

  get "/articles" do
    @articles = Article.all
    erb :index
  end

  get "/articles/:id" do
    id = params[:id]
    @article = Article.find(id)
    erb :show
  end

  get "/articles/:id/edit" do
    id = params[:id]
    @article = Article.find(id)
    erb :edit
  end


  # POSTS
  post "/articles" do
    @article = Article.create(params)
    redirect to "/articles/#{ @article.id }"
  end


 # OTHER
  patch "/articles/:id" do
    id = params[:id]
    art = params[:article]
    @article = Article.find(id)
    @article.update(art)
    redirect "/articles/#{ @article.id }"
  end

  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect "/articles"
  end
end