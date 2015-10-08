class Board

  def initialize
    @grid = Array.new(8) { Array.new(8) {nil} }
    fill_black_pieces
    fill_white_pieces
  end

  def move(start_pos, end_pos)
    #select piece at start_pos
    #make end_pos point to piece we're moving
    #make start_pos nil
    #raise exception if no piece at start_pos
    #raise exception if cannot move to end_pos
  end

end
