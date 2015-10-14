require_relative 'pieces'
require 'colorize'

class Board

  BACKGROUND_COLOR = {
    1 => :light_blue,
    0 => :light_red,
    :highlight => :yellow
  }

  UNICODE_PIECES = {
    Pawn   => '♟',
    Knight => '♞',
    Bishop => '♝',
    Rook   => '♜',
    Queen  => '♛',
    King   => '♚'
  }

  attr_accessor :highlight, :grid#, :selected

  def initialize
    @grid = Array.new(8) { Array.new(8) {nil} }
    add_white_pieces
    add_black_pieces
    @highlight = [5, 5]
    # @selected = :false
  end

  def add_white_pieces
    (0...8).each { |col| @grid[col][1] = Pawn.new([col, 1], :white, self) }
    [0, 7].each  { |col| @grid[col][0] = Rook.new([col, 0], :white, self) }
    [1, 6].each  { |col| @grid[col][0] = Knight.new([col, 0], :white, self) }
    [2, 5].each  { |col| @grid[col][0] = Bishop.new([col, 0], :white, self) }
    @grid[3][0] = Queen.new([3, 0], :white, self)
    @grid[4][0] = King.new([4, 0], :white,  self)
  end

  def add_black_pieces
    (0...8).each { |col| @grid[col][6] = Pawn.new([col, 6], :black, self) }
    [0,7].each   { |col| @grid[col][7] = Rook.new([col, 7], :black, self) }
    [1,6].each   { |col| @grid[col][7] = Knight.new([col, 7], :black, self) }
    [2,5].each   { |col| @grid[col][7] = Bishop.new([col, 7], :black, self) }
    @grid[3][7] = Queen.new([3, 7], :black, self)
    @grid[4][7] = King.new([4, 7], :black, self)
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
        render_square(x_coord, y_coord)
      end
      print "\n"
    end
    print "\n"
    print "   "
    ('A'..'H').each { |letter| print " #{letter} "}
    print "\n" * 3
    # print "Selecting: #{@selected}"
  end

  def render_square(x, y)
    piece = @grid[x][7-y]
    if @highlight[0] == x && @highlight[1] == (7 - y) && piece
      print " #{UNICODE_PIECES[piece.class]} ".colorize(piece.color).colorize(:background => BACKGROUND_COLOR[:highlight])
    elsif @highlight[0] == x && @highlight[1] == (7 - y)
      print "   ".colorize(:background => BACKGROUND_COLOR[:highlight])
    elsif piece
      print " #{UNICODE_PIECES[piece.class]} ".colorize(piece.color).colorize(:background => BACKGROUND_COLOR[(x + y) % 2])
    else
      print "   ".colorize(:background => BACKGROUND_COLOR[(x + y) % 2])
    end
  end

  def in_check?(color)
    king_piece = all_pieces(color).select { |piece| piece.is_a?(King) }.first
    all_pieces(other_color(color)).each do |piece|
      return true if piece.moves.include?(king_piece.position)
    end
    return false
  end

  def all_pieces(color)
    pieces = Array.new
    @grid.flatten.compact.each do |piece|
      if piece.color == color
        pieces << piece.dup
      end
    end
    pieces
  end

  def checkmate?(color)
    all_moves = all_pieces(color).inject([]) do |total_moves, piece|
      total_moves + piece.valid_moves
    end
    all_moves.empty?
  end

  def dup
    dup_board = Board.new
    (0...8).each do |row|
      (0...8).each do |col|
        dup_board.grid[row][col] = (@grid[row][col] ? @grid[row][col].dup : nil)
      end
    end
    dup_board
  end
end
