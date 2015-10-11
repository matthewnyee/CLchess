require_relative 'stepping_piece'

class Pawn < SteppingPiece

  def move_dirs
    diagonals = [[1, 1], [-1, 1]]
    vertical  = [0, 1]

    if @color == :black
      diagonals.map! { |pos| reverse_direction(pos) }
      vertical = reverse_direction(vertical)
    end

    diagonals.select! do |step|
      if in_range?(modify_position(@position, step))
        occupied_by(modify_position(@position, step)) == :foe
      end
    end

    if !occupied_by(modify_position(@position, vertical))
      diagonals << vertical
    end

    diagonals
  end

  def reverse_direction(pos)
    [pos[0], -1 * pos[1]]
  end

end
