require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do 
        erb :super_hero 
    end 

    post '/teams' do 
        @team = Team.new(params[:team])

        params[:team][:hero].each do |params|
            Hero.new(params)
        end 

        @hero = Hero.all 
        erb :team

    end 


end
