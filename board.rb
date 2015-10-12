require_relative 'pieces'
require 'colorize'

class Board

  BACKGROUND_COLOR = {
    1 => :light_blue,
    0 => :light_red,
    :highlight => :yellow
  }

  attr_accessor :highlight, :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) {nil} }
    add_white_pieces
    add_black_pieces
    @highlight = [5, 5]
  end

  def add_white_pieces
    (0...8).each { |col| @grid[col][1] = Pawn.new(:white, [col, 1], self) }
    [0, 7].each  { |col| @grid[col][0] = Rook.new(:white, [col, 0], self) }
    [1, 6].each  { |col| @grid[col][0] = Knight.new(:white, [col, 0], self) }
    [2, 5].each  { |col| @grid[col][0] = Bishop.new(:white, [col, 0], self) }
    @grid[3][0] = Queen.new(:white, [3, 0], self)
    @grid[4][0] = King.new(:white, [4, 0], self)
  end

  def add_black_pieces
    (0...8).each { |col| @grid[col][6] = Pawn.new(:black, [col, 6], self) }
    [0,7].each   { |col| @grid[col][7] = Rook.new(:black, [col, 7], self) }
    [1,6].each   { |col| @grid[col][7] = Knight.new(:black, [col, 7], self) }
    [2,5].each   { |col| @grid[col][7] = Bishop.new(:black, [col, 7], self) }
    @grid[3][7] = Queen.new(:black, [3, 7], self)
    @grid[4][7] = King.new(:black, [4, 7], self)
  end

  def move(start_pos, end_pos)
    #select piece at start_pos
    #make end_pos point to piece we're moving
    #make start_pos nil
    #raise exception if no piece at start_pos
    #raise exception if cannot move to end_pos
  end

  def display
    print "\n" * 50
    (0...8).each do |y_coord|
      print "#{8-y_coord}  "
      (0...8).each do |x_coord|
        if @highlight[0] == x_coord && @highlight[1] == (7 - y_coord)
          print "   ".colorize(:background => BACKGROUND_COLOR[:highlight])
        else
          print "   ".colorize(:background => BACKGROUND_COLOR[(x_coord + y_coord) % 2])
        end
      end
      print "\n"
    end
    print "\n"
    print "   "
    ('A'..'H').each { |letter| print " #{letter} "}
    print "\n" * 3
  end

  def render_square
  end

end
