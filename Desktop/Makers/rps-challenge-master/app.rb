require 'sinatra/base'

#add sessions first???
#sessions


class Signin < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post '/player' do
    @player = params[:name]
    erb(:game_player)
  end

  run! if app_file == $0
end
