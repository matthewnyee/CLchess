require_relative 'piece'

class SteppingPiece < Piece

  def moves
    all_moves = move_dirs.map { |mod| modify_position(@position, mod) }
    all_moves.select { |spot| in_range?(spot) && occupied_by(spot) != :friend }
  end
end
