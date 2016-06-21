require 'pry'
require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

  get '/' do
    guess = params["guess"]
    message = check_guess(guess)
    erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
  end

  def check_guess(guess)
    number = SECRET_NUMBER
    guess = guess.to_i
    case
    when guess > number + 5
      "Way too high!"
    when guess > number
      "Too high!"
    when guess < number - 5
      "Way too low!"
    when guess < number
      "Too low!"
    when guess == number
      "You got it right!"
      "The SECRET NUMBER is #{SECRET_NUMBER}"
    end
  end
