require_relative '../../config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # GETS


  get "/articles/new" do
    @article = Article.new
    erb :new
  end

  get "/articles" do
    @articles = Article.all
    erb :index
  end

  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end

  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :edit
  end


  # POSTS
  post "/articles" do
    @article = Article.create(params)
    redirect to "/articles/#{ @article.id }"
  end


 # OTHER
  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect "/articles/#{ @article.id }"
  end

  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect "/articles"
  end


end