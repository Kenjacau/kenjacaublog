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

get '*/blog' do
  #Latest post gets to the top
  @blogposts = Blogpost.order("id DESC")
  erb :blog
end


get '/comments/:id' do
  #Latest post gets to the top

  @comments = Comment.where(comments_id: params[:id])
  erb :blog
end


post '*/createcomment' do
  comment = Comment.new(params[:comment])
  if comment.save
    redirect to "/blog"
  else
    return "failure!"
  end
end

get '/readmore/:id' do
@blogreadmore = Blogpost.find_by_id(params[:id])

erb :readmore
end

def commentcount(blogpostid)
  return Comment.where(blogposts_id: blogpostid).size
end

def getcomments(blogpostid)
  Comment.where(blogposts_id: blogpostid)
end 
def getlink(blogpost)
  post = blogpost
  if post.hreflink.to_s == ''
    return ""
  else
    return "link"
  end
end