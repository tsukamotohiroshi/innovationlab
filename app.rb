# myapp.rb
require 'sinatra'
require 'erb'

post '/res' do
  @name = params[:name]
  @ans = params[:q1]

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