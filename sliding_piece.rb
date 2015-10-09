class SlidingPiece < Piece

  def moves
    move_dirs.inject(Array.new) do |move_array, mod|
      move_array << [mod[0] + @position[0], mod[1] + @position[1]]
    end
  end

end
