require 'io/console'
require_relative 'board'

class Game

  def initialize
    @board = Board.new
    @board.display
    move_highlight
  end

  def move_highlight
    while true
      command = STDIN.getch
      if command == "a"
        @board.highlight[0] = (@board.highlight[0] - 1)
      elsif command == "d"
        @board.highlight[0] = (@board.highlight[0] + 1)
      elsif command == "w"
        @board.highlight[1] = (@board.highlight[1] + 1)
      elsif command =="s"
        @board.highlight[1] = (@board.highlight[1] - 1)
      elsif command == "q"
        exit
      end
      @board.display
    end
  end

end

Game.new
