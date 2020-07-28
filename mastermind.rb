require_relative './code_maker.rb'
require_relative './code_breaker.rb'
require_relative './displayable.rb'
require_relative './game_constants.rb'
require 'pry'

class Mastermind
  include Displayable

  def initialize
    @code = CodeMaker.new
    @player = CodeBreaker.new
    @turn = 0
  end

  def start
    title
    game_explanation
    game_instructions
    generating_pattern
    @code.create_code
    pattern_generated

    player_enter
  end

  def player_enter
    @turn += 1
    puts "\sTurn #{@turn}"
    print "\sMake your guess: "
    guess = gets.chomp
    result = @player.compare_guess(guess, @code.array)
    @player.winner(guess, @code.array)
    next_round(guess, result)
  end

  def next_round(guess, result)
    if @turn < 12
      player_enter
    else
      game_over_lost
    end
  end
end

play = Mastermind.new

play.start