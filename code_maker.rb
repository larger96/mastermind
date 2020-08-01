require_relative './game_constants.rb'

class CodeMaker
  include GameConstants
  
  attr_accessor :array

  COLORS = ['r', 'g', 'b', 'y', 'o', 'p']

  def initialize
    @array = []
  end

  def create_code
    4.times do
      @array.push(COLORS[rand(COLORS.length)])
    end
    @array
  end

  def assign_code
    code = gets.chomp
  end

  def print_code
    print "\s#{@array}\n"
  end
end