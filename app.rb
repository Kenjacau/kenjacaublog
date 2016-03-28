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
  has_many :comment
end

class Comment < ActiveRecord::Base
  belongs_to :blogpost
end

get '/' do
  #Latest post gets to the top
  @blogposts = Blogpost.order("id DESC")
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
