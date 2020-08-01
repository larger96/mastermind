# frozen_string_literal: true

require_relative './game_constants.rb'

# Player who cracks secret code
class CodeBreaker
  include GameConstants

  attr_accessor :guess

  def initialize
    @guess = []
    @feedback = []
    @correct_chars = ['', '', '', '']
    @include_chars = []
    @i = 0
  end

  def make_guess
    @guess = ['', '', '', '']
    add_correct_chars
    fill_empty
    optimize_guess
    @guess.join('')
  end

  def fill_empty
    i = 0
    @guess.each do |guess|
      @guess[i] = COLORS[rand(COLORS.length)] if guess == ''
      i += 1
    end
  end

  def add_correct_chars
    i = 0
    @correct_chars.each do |char|
      @guess[i] = char if char != ''
      i += 1
    end
  end

  def optimize_guess
    @include_chars.each do |char|
      make_guess unless @guess.include?(char)
    end
  end

  def compare_guess(guess, code, game_mode)
    @feedback = []
    if game_mode == 1
      create_feedback_player(guess, code)
    else
      create_feedback_computer(guess, code)
    end
    print "\sFeedback: #{@feedback.sort.reverse}\n"
    puts
  end

  def create_feedback_player(guess, code)
    i = 0
    guess.each_char do |color|
      if code.include?(color) && guess[i] == code[i]
        feedback('cross')
      elsif code.include?(color)
        feedback('star')
      else
        feedback('none')
      end
      i += 1
    end
  end

  def create_feedback_computer(guess, code)
    i = 0
    guess.each_char do |color|
      if code.include?(color) && guess[i] == code[i]
        @correct_chars[i] = guess[i]
        feedback('cross')
      elsif code.include?(color)
        include_characters(guess[i])
        feedback('star')
      else
        feedback('none')
      end
      i += 1
    end
  end

  def include_characters(guess)
    @include_chars.push(guess) unless @include_chars.include?(guess)
  end

  def feedback(peg)
    if peg == 'cross'
      @feedback.push('X')
    elsif peg == 'star'
      @feedback.push('*')
    else
      @feedback.push(' ')
    end
  end

  def winner?
    @feedback == %w[X X X X]
  end
end
