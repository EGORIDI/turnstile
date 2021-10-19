require_relative 'turnstile'
require "minitest/autorun"

class TestTurnstile < Minitest::Test 
  def setup
    @turnstile = Turnstile.new(["unlocked", "locked"].sample)
  end

  def test_unlocked
    if @turnstile.current_state == "unlocked"
      #
    else
      #
    end
  end
end

