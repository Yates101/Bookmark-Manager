require_relative './lib/bookmark'
require 'pg'
require 'sinatra/base'

class BookmarksManager < Sinatra::Base

  enable :method_override

  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
    erb(:bookmarks)
  end

  get '/bookmarks/new' do
    erb(:new_bookmark)
  end

  post '/bookmarks' do
    Bookmark.add(params[:url], params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
