require 'io/console'
require_relative 'board'

class Game

  def initialize
    @board = Board.new
    @getting_piece = true
    @playing = true
  end

  def play
    while @playing
      print "It's #{@board.to_move}'s turn to move\n"
      take_turn(@board.to_move)
      # if @board.checkmate?(@board.to_move)
      #   @playing = false
      # end
    end
    print "#{@board.to_move} lost the game\n"
  end

  def take_turn(player)
    if player == :white
      @board.display
      print "q to quit\n"
      print "W/A/S/D to move, [return] to select\n"
      if @getting_piece
        print "Please pick a piece\n"
      else
        print "Please select a spot to put the piece you've selected\n"
      end
      command = STDIN.getch
      take_action(command)
    else
      generate_black_move
    end
  end

  def take_action(command)
    if command == "a"
      move_highlight([-1, 0])
    elsif command == "d"
      move_highlight([1,  0])
    elsif command == "w"
      move_highlight([0,  1])
    elsif command =="s"
      move_highlight([0, -1])
    elsif command == "\r"
      move_piece(@board.highlight)
    elsif command == "q"
      exit
    end
  end

  def move_piece(pos)
    if @getting_piece
      square = @board.get_piece_at(pos)
      if square
        if square.color == @board.to_move
          @piece_pos = pos
          @getting_piece = false
        else
          print "That's not your piece!"
        end
      else
        print "You can't pick that!"
      end
    else
      if pos != @piece_pos
        @board.move(@piece_pos, pos)
        @getting_piece = true
      else
        print "You can't put it there"
      end
    end
  end

  def move_highlight(mod)
    new_pos = [@board.highlight, mod].transpose.map { |coord| coord.inject(:+) }
    if new_pos.all? { |coord| coord.between?(0, 7) }
      @board.highlight = new_pos
    end
  end

  def generate_black_move
    random_piece = @board.get_all_pieces(:black).sample
    while random_piece.moves.empty?
      random_piece = @board.get_all_pieces(:black).sample
    end
    start_pos = random_piece.position
    end_pos   = random_piece.valid_moves.sample
    @board.move(start_pos, end_pos)
  end
end

Game.new.play
