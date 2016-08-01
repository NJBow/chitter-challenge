require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

 ENV["RACK_ENV"] ||= "development"

 class Shtter < Sinatra::Base

   enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash


   get '/' do
     'ghgh'
   end

   get '/users/new' do
     @user = User.new
    erb :'users/new'
   end

   post '/users' do
     @user = User.create(email: params[:email], username: params[:username],
                 password: params[:password], password_confirmation: params[:password_confirmation])
     if @user.save
       session[:user_id] = @user.id
       redirect to('/chit_chat')
     else
       flash.now[:errors] = @user.errors.full_messages
       erb :'users/new'
     end
   end

   get '/chit_chat' do
     erb :'chit_chat/index'
   end

  get '/sessions/new' do
        erb :'sessions/new'
   end

   post '/sessions' do
     user = User.authenticate(params[:email], params[:password])
     if user
       session[:user_id] = user.id
       redirect to('/chit_chat')
     else
       flash.now[:errors] = ['The email/password is/are incorrect']
       erb :'sessions/new'
     end
   end

   helpers do
     def current_user
       @current_user ||= User.get(session[:user_id])
     end
   end

   run! if app_file == $0
 end
