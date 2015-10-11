class SlidingPiece < Piece

  def moves
    move_dirs.inject(Array.new) do |move_array, mod|
      new_pos = [@position, mod].transpose.map {|coord| coord.inject(:+)}
        # need to set new_pos, otherwise occupied_by?(@position) will return
        # :friend, because your color == your color ==> :friend
      move_array << get_entire_direction(new_pos, mod)
    end
  end

  def get_entire_direction(pos, mod)
    return [] if !in_range?(pos) || occupied_by(pos) == :friend
    return [pos] if occupied_by(pos) == :foe
    get_entire_direction(modify_position(pos, mod), mod) << pos
  end

end
