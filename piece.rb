class Piece

  attr_reader :color

  LINEARS = [[1, 0], [0,  1], [-1, 0], [0,  -1]]
  DIAGONALS = [[1, 1], [1, -1], [-1, 1], [-1, -1]]

  def initialize(color, position, board)
    @position = position
    @color    = color
    @board    = board
  end


  def moves
    #return array of moves
  end

  def in_range?(pos)
    pos.all? { |coord| coord.between?(0, 7) }
  end

  def occupied_by(pos)
    square = @board.grid[pos[0]][pos[1]]
    if square.nil?
      return nil
    else
      square.color == @color ? (return :friend) : (return :foe)
    end
  end

  #private?
  def modify_position(pos, mod)
    [pos, mod].transpose.map { |coord| coord.inject(:+) }
  end

end
