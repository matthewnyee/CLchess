require_relative 'sliding_piece'

class Rook < SlidingPiece

  def move_dirs
    LINEARS.map(&:dup)
  end
end
