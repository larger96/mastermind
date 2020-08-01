# frozen_string_literal: true

require_relative './game_constants.rb'

# Player who creates secret code
class CodeMaker
  include GameConstants

  attr_accessor :array

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
    gets.chomp
  end

  def print_code
    print "\s#{@array}\n"
  end
end
