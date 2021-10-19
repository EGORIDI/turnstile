# Simulates a turnstile (catraca) operating on coins

# This class simulates the FSM Finite State Machine
# that is a turnstile, unlocking whenever it is locked and
# has a coin inserted in. It also opens when is unlocked 
# and then pushed, then, the customer passes thorough.

class Turnstile # the Finite State Machine
  
  def initialize (current_state)
    @current_state = current_state
  end

  def display_current_state
    puts
    puts "Turnstile is currently #{@current_state}"
  end

  def place_challenge 
    puts "Choose an input (place 'coin' or 'push'):"
    choice = gets.chomp
    puts
    return choice
  end

  def customer_input(action)
    @turnstile_output = nil

    if @current_state == "unlocked"
      if action == "push"
        @turnstile_output = "passed_thorough"
        @current_state = "locked"
        puts "Congratulations, you successfully passed thorough"
      elsif action == "coin"
        @turnstile_output = "none"
        passed_thorough = false
        # turnstile remains unlocked, so no need to 
        # update variable
        puts "Turnstile is already unlocked... just push it, it's not that difficult."
      else
        puts "I just hope you're not vandalizing this equipment..."
      end
    else
      if action == "push"
        @turnstile_output = "customer blocked"
        # turnstil remains unlocked
        puts "My dear, turnstile won't open unless you put a coin, just pushing won't work. Not rocket science here..."
      elsif action == "coin"
        @turnstile_output = "unlocks the turnstile"
        passed_thorough = false
        @current_state = "unlocked"
        puts "You successfully unlocked the turnstile"
      else 
        puts "The turnstile didn't understand your input. Please insert a coin to unlock it."
      end
    end

    state_and_output = {state: @current_state, output: @turnstile_output}
    return state_and_output
  end
end

map_of_states = ["unlocked", "locked"]
turnstile_state = map_of_states.sample
catraca = Turnstile.new(turnstile_state)

suceeded = false

until suceeded # |catraca, turnstile_state|
  # either the attempt is successful or the customer gives up
  # trying.
  #
  
  # this loop repeats the attempts to pass the turnstile until
  catraca.display_current_state
  choice = catraca.place_challenge

  result_from_choice = catraca.customer_input(choice)
  puts result_from_choice
  turnstile_state = result_from_choice[:state]
  turnstile_output = result_from_choice[:output]
  suceeded = true if turnstile_output == "passed_thorough" || choice == ("exit" || "give up") 

  puts "The current turnstile state is #{turnstile_state}"
  puts "The output of the turnstile is #{turnstile_output}"
  puts
end

