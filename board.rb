class Board
  def initialize
    @previous = []
    @result = []
  end

  def create_board
    puts "-----------------"
    puts "| 1 | 2 | 3 | 4 |"
    puts "-----------------"
    puts "| X | X | X | X |"
    puts "-----------------"
  end

  def game_board(guess)
    puts "-----------------"
    puts "| #{guess[0]} | #{guess[1]} | #{guess[2]} | #{guess[3]} |"
    puts "-----------------"
    puts "| 1 | 2 | 3 | 4 |"
    puts "-----------------"
    puts "| X | X | X | X |"
    puts "-----------------"
  end
end