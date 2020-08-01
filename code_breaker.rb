require_relative './game_constants.rb'

class CodeBreaker
  include GameConstants

  attr_accessor :guess

  def initialize
    @guess = []
    @feedback = []
    @correct_chars = ["", "", "", ""]
    @include_chars = []
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
      if guess == ''
        @guess[i] = COLORS[rand(COLORS.length)]
      end
      i += 1
    end
  end

  def add_correct_chars
    i = 0
    @correct_chars.each do |char|
      if char != ''
        @guess[i] = char
      end
      i += 1
    end
  end

  def optimize_guess
    @include_chars.each do |char|
      if !@guess.include?(char)
        make_guess
      end
    end
  end

  def compare_guess(guess, code)
    @feedback = []
    i = 0
    guess.each_char do |color|
      if code.include?(color) && guess[i] == code[i]
        feedback("cross")
      elsif code.include?(color)
        feedback("star")
      else
        feedback("none")
      end
      i += 1
    end
    print "\sFeedback: #{@feedback.sort.reverse}\n"
    puts
  end

  def comp_compare_guess(guess, code)
    @feedback = []
    i = 0
    guess.each_char do |color|
      if code.include?(color) && guess[i] == code[i]
        @correct_chars[i] = guess[i]
        feedback("cross")
      elsif code.include?(color)
        include_characters(guess[i])
        feedback("star")
      else
        feedback("none")
      end
      i += 1
    end
    print "\sFeedback: #{@feedback.sort.reverse}\n"
    puts
  end

  def include_characters(guess)
    if !@include_chars.include?(guess)
      @include_chars.push(guess)
    end
  end

  def feedback(peg)
    if peg == "cross"
      @feedback.push('X')
    elsif peg == "star"
      @feedback.push('*')
    else
      @feedback.push(' ')
    end
  end

  def winner?
    @feedback == ['X', 'X', 'X', 'X']
  end
end