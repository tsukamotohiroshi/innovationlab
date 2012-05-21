# myapp.rb
require 'sinatra'
require 'erb'
require 'omniauth'
require 'omniauth-facebook'

enable :sessions

use OmniAuth::Builder do
  provider :facebook,"",""
end

post '/res' do
  @ans = params[:q1]
  @name = session[:name]
  
  if @ans == "n"
    @score = rand(501) + 500
  elsif @ans == "y"
    @score = rand(500)
  else
    @score = 0
  end

  erb :result
end

get '/' do
  erb :index
end

get '/auth/facebook/callback' do
  @auth = request.env['omniauth.auth']
  session[:name] = @auth[:info][:name]
  erb :callback
end