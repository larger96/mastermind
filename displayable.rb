# frozen_string_literal: true

require_relative './game_constants.rb'

# Text instructions for Mastermind
module Displayable
  include GameConstants

  def title
    puts "\t-----------------------------------"
    puts "\tMASTERMIND: CAN YOU CRACK THE CODE?"
    puts "\t-----------------------------------"
  end

  def game_explanation
    puts "\n\sWhat is Mastermind?"
    puts "\s-------------------"
    puts "\sMastermind is a game where you have to guess your opponent's secret code"
    puts "\swithin a certain number of turns. Each turn you get some feedback about"
    puts "\show good your guess was."
  end

  def game_instructions
    puts "\n\sHow to Play"
    puts "\s-----------"
    puts "\s\s1. You have 12 turns to guess the code."
    puts "\s\s2. These are your options: "
    options
    puts "\s\s3. Enter your code by inputting a 4 color guess. Example 'rgby'."
    puts "\s\s4. You will recieve feedback after every turn:"
    puts "\t'X' => correct color in the correct position."
    puts "\t'*' => correct color in the wrong position."
    puts "\s\s5. Have fun!"
  end

  def options
    puts "\tRed    => 'r'"
    puts "\tGreen  => 'g'"
    puts "\tBlue   => 'b'"
    puts "\tYellow => 'y'"
    puts "\tOrange => 'o'"
    puts "\tPink   => 'p'"
  end

  def generating_pattern
    puts "\n\s#{COMPUTERS_NAME} is generating a pattern..."
  end

  def pattern_generated
    puts "\sThe pattern is ready for you to attempt cracking."
    puts "\sLet's begin!"
    puts
  end

  def create_your_pattern
    puts "\n\sCreate your secret 4 color pattern for #{COMPUTERS_NAME} to guess."
    puts "\sChoose wisely, he has the brain the size of a planet."
    print "\s\s>> "
  end

  def pattern_created
    puts "\sYou have created your pattern."
    puts "\sLet's begin!"
    puts
  end

  def game_modes
    puts "\n\s#{COMPUTERS_NAME} has given you the choice to either be the CodeBreaker or the CodeMaker."
    puts "\s('It's not like it matters, you'd do what you want anyway')"
    puts
    puts "\sWhat do you choose?"
    puts "\s\s1) CodeBreaker"
    puts "\s\s2) CodeMaker"
    print "\s\s>> "
  end

  def turn_counter(turn)
    puts "\sTurn #{turn}"
    print "\sMake your guess: "
  end

  def invalid_input
    puts "\sEnter a valid option"
    print "\s\s>> "
  end

  def game_over_win(code)
    puts "\sCongratulations you cracked the code!"
    print "\s#{code}\n"
    exit
  end

  def game_over_lost
    puts "\sYou have run out of guesses."
    puts "\sThe code wasn't cracked."
    puts "\sBetter luck next time."
    exit
  end
end
