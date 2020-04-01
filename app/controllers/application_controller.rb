
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end



  get '/articles' do 
    @articles= Articles.all
    erb :index
  end

  get '/articles/new' do
  erb :new
end


get '/articles/:id' do
  @article= Articles.find(params[:id])
  erb :show
end

get '/articles/:id/edit' do
  @article= Article.find(params[:id])
erb :edit
end

post '/articles' do
article=Articles.create(params)
redirect to :"/article/#{article.id}"
end

patch '/articles/:id' do
  
article = Articles.find(params[:id])
article.update(params[:article])

redirect to :"/articles/#{article.id}"
end

delete '/articles/:id' do
article= Articles.find(params[:id])
article.destroy
redirect to :"/articles"
end
end
