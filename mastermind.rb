require_relative './code_maker.rb'
require_relative './code_breaker.rb'
require_relative './displayable.rb'
require_relative './game_constants.rb'
require 'pry'

class Mastermind
  include Displayable

  def initialize
    @code = ''
    @player = CodeBreaker.new
    @turn = 0
    @game_won = false
  end

  def start
    title
    game_explanation
    game_instructions
    generating_pattern
    @code = CodeMaker.new.create_code
    pattern_generated

    player_enter
  end

  def player_enter
    @turn += 1
    turn_counter(@turn)
    guess = gets.chomp
    @player.compare_guess(guess, @code)
    @game_won = @player.winner?
    next_round
  end

  def next_round
    if @turn <= 12 && @game_won == true
      game_over_win(@code)
    elsif @turn < 12
      player_enter
    else
      game_over_lost
    end
  end
end

play = Mastermind.new

play.start