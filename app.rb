# myapp.rb
require 'sinatra'
require 'erb'
require 'omniauth'
require 'omniauth-facebook'

enable :sessions

configure do
  use Rack::Session::Cookie, :secret => Digest::SHA1.hexdigest(rand.to_s)
end

use OmniAuth::Builder do
  provider :facebook,"335506539856315","3b3efe09fd9e49f3134a217b2fa9ac3b"
end

post '/res' do
  @ans = params[:q1]
  @name = session[:name]
  
  if @ans == "n"
    @score = rand(500) + 500
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