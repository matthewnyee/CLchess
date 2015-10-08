require 'io/console'
require_relative 'board'

class Game

  def initialize
    @board = Board.new
    @board.display
  end

  def get_player_input
    STDIN.getch
    modify(@board.highlight)
  end


end

Game.new.play
