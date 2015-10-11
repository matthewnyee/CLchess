require_relative 'stepping_piece'

class Knight < SteppingPiece

  def move_dirs
    KNIGHTS.map(&:dup)
  end
end
