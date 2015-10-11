require_relative 'sliding_piece'

class Queen < SlidingPiece

  def move_dirs
    (DIAGONALS + LINEARS).map(&:dup)
  end
end
