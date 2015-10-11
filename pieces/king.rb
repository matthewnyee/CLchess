require_relative 'stepping_piece'

class King < SteppingPiece

  def move_dirs
    (DIAGONALS + LINEARS).map(&:dup)
  end
end
