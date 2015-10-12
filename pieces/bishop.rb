require_relative 'sliding_piece'

class Bishop < SlidingPiece

  def move_dirs
    DIAGONALS.map(&:dup)
  end

end
