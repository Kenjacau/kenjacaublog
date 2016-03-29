require 'sinatra'
require 'uri'
require 'active_record'

db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///blogbase')

set :public_folder, "public"

ActiveRecord::Base.establish_connection(
  :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
  :host     => db.host,
  :username => db.user,
  :password => db.password,
  :database => db.path[1..-1],
  :encoding => 'utf8'
)

class Blogpost < ActiveRecord::Base
  has_many :comments
end

class Comment < ActiveRecord::Base
  belongs_to :blogpost, :counter_cache => true 
end

get '/' do
  erb :home
end

get '/resume' do
  redirect '/static/resume.html' 
end

get '/blog' do
  #Latest post gets to the top
  @blogposts = Blogpost.order("id DESC")
  @comments = Comment.where(blogposts_id: params[:id])
  erb :blog
end


get '/comments/:id' do
  #Latest post gets to the top

  @comments = Comment.where(comments_id: params[:id])
  erb :blog
end

get '/createcomment' do
  erb :create
end


post '/createcomment' do
  customer = Comment.new(params[:comment])
  if customer.save
    redirect to "/"
  else
    return "failure!"
  end
end

get '/readmore/:id' do
@blogreadmore = Blogpost.where(blogposts_id: params[:id])

erb :readmore
end

def commentcount(blogpostid)
  return Comment.where(blogposts_id: blogpostid).size
end