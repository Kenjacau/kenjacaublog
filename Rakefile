require './app.rb'
require 'sinatra/activerecord/rake'

namespace :sin do 
    desc "run sinatra"
    task :run do 
        sh "ruby app.rb -p $PORT -o $IP"    
        end
    
    
end



namespace :sql do
    desc "postgresql start"
    task :pstart do
       sh "sudo service postgresql start" 
       
    end
    desc "Switch to user postgres"
    task :psql do 
       sh "sudo su postgres"
   end
end



