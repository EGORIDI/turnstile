require_relative 'turnstile'
require "minitest/autorun"

class TestTurnstile < Minitest::Test 
  def setup
    @turnstile = turnstile.new
  end

  def test_unlocked
    if @turnstile.current_state == "unlocked"
      #
    else
      #
    end
  end
end

