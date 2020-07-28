class CodeBreaker
  attr_accessor :guess

  def initialize
    @guess = []
    @feedback = []
  end

  def make_guess(a, b, c, d)
    @guess = []
    @guess.push(a, b, c, d)
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

  def feedback(peg)
    if peg == "cross"
      @feedback.push('X')
    elsif peg == "star"
      @feedback.push('*')
    else
      @feedback.push(' ')
    end
  end

  def winner(guess, code)
    if @feedback == ['X', 'X', 'X', 'X']
      puts "\sCongratulations! You cracked the code!"
      p code
      exit
    end
  end
end