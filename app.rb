require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'
require './database_connection_setup'
require 'uri'
require 'pry'


class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    'Bookmark Manager'
    # redirect('/bookmarks')
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    result = erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    flash[:notice] = "You must submit a valid URL." unless Bookmark.add(url: params['url'], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    # connection.exec("DELETE FROM bookmarks WHERE id = #{params['id']}")
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  # get /bookmarks/<%= bookmark.id %>/edit do
  get '/bookmarks/:id/edit' do
    # @bookmark_id = params[:id]
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect('/bookmarks')
  end

  get '/bookmarks/:id/comments/new' do
    @bookmark_id = params[:id]
    erb :'comments/new'
  end

  post '/bookmarks/:id/comments' do
    # bookmark = Bookmark.find(params[:id])
    # bookmark.comments.create(:)
    # p "pee comment"
    p params
    # p "pee id"
    # p params[:id]
    connection = PG.connect(dbname: 'bookmark_manager')
    connection.exec("INSERT INTO comments (text, bookmark_id) VALUES('#{params[:comment]}', #{params[:id]});")
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
