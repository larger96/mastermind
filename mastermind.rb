require_relative './code_maker.rb'
require_relative './code_breaker.rb'
require_relative './displayable.rb'
require_relative './game_constants.rb'
require 'pry'

class Mastermind
  include Displayable

  def initialize
    @code = ''
    @player = ''
    @computer = ''
    @turn = 0
    @game_mode = ''
    @game_won = false
  end

  def start
    title
    game_explanation
    game_instructions
    game_modes
    choose_game_mode
  end

  def choose_game_mode
    @game_mode = gets.chomp
    if @game_mode == "1"
      @player = CodeBreaker.new
      comp_code_maker
    elsif @game_mode == "2"
      @computer = CodeBreaker.new
      player_code_maker
    else
      puts "\sEnter a valid option"
      print "\s\s>> "
      choose_game_mode
    end
  end

  def comp_code_maker
    generating_pattern
    @code = CodeMaker.new.create_code
    pattern_generated

    player_guess
  end

  def player_code_maker
    create_your_pattern
    @code = CodeMaker.new.assign_code
    pattern_created

    computer_guess
  end

  def player_guess
    @turn += 1
    turn_counter(@turn)
    guess = gets.chomp
    @player.compare_guess(guess, @code)
    @game_won = @player.winner?
    next_round
  end

  def computer_guess
    @turn += 1
    turn_counter(@turn)
    guess = @computer.make_guess
    puts guess
    @computer.comp_compare_guess(guess, @code)
    @game_won = @computer.winner?
    next_round
  end

  def next_round
    if @turn <= 12 && @game_won == true
      game_over_win(@code)
    elsif @turn < 12
      if @game_mode == "1"
        player_guess
      else
        computer_guess
      end
    else
      game_over_lost
    end
  end
end

new_game = Mastermind.new

new_game.start