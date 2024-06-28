require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/srisai") do
 "Hello Srisai, Welcome to the world of computing"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  @rolls=[]
    @rolls.push(first_die)
    @rolls.push(second_die)
  '''
  sum = first_die + second_die
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
'''
  erb(:two_six)
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1...10)
  '''sum = first_die + second_die
  outcome = "You rolled #{first_die} and #{second_die} and there sum is #{sum}"'''
  @rolls = [first_die, second_die]
  erb(:two_ten)


end

get("/dice/1/20") do
  @die = rand(1..20)
  
  @outcome = "#{@die}"
  erb(:one_twenty)
  
end

get("/dice/5/4") do
  '''first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  sum1 = first_die + second_die + third_die + fourth_die
  
  outcome = "You rolled #{first_die}, #{second_die}, #{third_die}, and #{fourth_die}"'''
@array=[]
  4.times do
    @array.push(rand(1..4))
  end
erb(:five_four)
  
end

get("/") do
  erb(:elepanth)
end

get("/dice/100/6") do
  @rolls = []    

  100.times do    
    die = rand(1..6)    

    @rolls.push(die)    
  end

  erb(:one_hundred_six)
end
