require 'pry'
require 'sinatra'
require 'sinatra/reloader'

@@secret_number = rand(100)
@@num_of_guesses = 5

  get '/' do
    guess = params["guess"]
    message = check_guess(guess)
    erb :index, :locals => {:number => @@secret_number, :message => message}
  end

  def check_guess(guess)
    number = @@secret_number
    guess = guess.to_i
    @@num_of_guesses -= 1
    case
    when @@num_of_guesses == 0
      reset
      "You lose! Try again."
    when guess == 0
      @@num_of_guesses += 1
      "Please enter a guess: "
    when guess > number + 5
      "Way too high!"
    when guess > number
      "Too high!"
    when guess < number - 5
      "Way too low!"
    when guess < number
      "Too low!"
    when guess == number
      correct_number = number
      reset
      "You got it right!"
      "The SECRET NUMBER is #{number}"
    end
  end

  def reset
    @@num_of_guesses = 5
    @@secret_number = rand(100)
  end
