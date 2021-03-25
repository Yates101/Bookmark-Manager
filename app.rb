require_relative './lib/bookmark'
require 'pg'
require 'sinatra/base'

class BookmarksManager < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/bookmark' do
    erb(:bookmark)
  end

  post '/add' do
    Bookmark.add(params[:url])
    redirect '/bookmark'
  end
  
  run! if app_file == $0

end
