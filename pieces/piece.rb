class Piece

  attr_reader :position, :color, :board

  LINEARS = [[1, 0], [0,  1], [-1, 0], [0,  -1]]
  DIAGONALS = [[1, 1], [1, -1], [-1, 1], [-1, -1]]
  KNIGHTS   = [
    [-1,  2],
    [1,   2],
    [2,   1],
    [2,  -1],
    [1,  -2],
    [-1, -2],
    [-2, -1],
    [-2,  1],
  ]

  def initialize(position, color, board)
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

  def modify_position(pos, mod)
    [pos, mod].transpose.map { |coord| coord.inject(:+) }
  end

  def valid_moves
    self.moves.select do |move|
      x, y = move[0], move[1]
      temp_board = @board.dup
      temp_board.grid[@position[0]][@position[1]] = nil
      temp_board.grid[x][y] = self.class.new(move, self.color, temp_board)
      !temp_board.in_check?(@color)
    end
  end

end
