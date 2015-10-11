require_relative 'pieces'

class Board

  attr_accessor :highlight, :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) {nil} }
    #fill_black_pieces
    #fill_white_pieces
    @highlight = [5, 5]
  end

  def move(start_pos, end_pos)
    #select piece at start_pos
    #make end_pos point to piece we're moving
    #make start_pos nil
    #raise exception if no piece at start_pos
    #raise exception if cannot move to end_pos
  end

  def display
    print "\n" * 50
    (0...8).each do |y_coord|
      print "#{8-y_coord}  "
      (0...8).each do |x_coord|
        if @highlight[0] == x_coord && @highlight[1] == (7 - y_coord)
          print " H "
        else
          print "   "
        end
      end
      print "\n"
    end
    print "\n"
    print "   "
    ('A'..'H').each { |letter| print " #{letter} "}
    print "\n" * 3
  end

end
