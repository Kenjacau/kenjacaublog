require 'sinatra'
require 'uri'
require 'active_record'

db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///mycustomers')

set :public_folder, "public"

ActiveRecord::Base.establish_connection(
  :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
  :host     => db.host,
  :username => db.user,
  :password => db.password,
  :database => db.path[1..-1],
  :encoding => 'utf8'
)

class Customers < ActiveRecord::Base
end

get '/' do
  #Latest post gets to the top
  @customers = Customers.order("id DESC")
  erb :index
end

get '/create' do
  erb :create
end


post '/create' do
  customers = Customers.new(params[:customers])
  if customers.save
    redirect to "/"
  else
    return "failure!"
  end
end