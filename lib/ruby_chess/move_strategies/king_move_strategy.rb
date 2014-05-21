module RubyChess

  class KingMoveStrategy < MoveStrategy

    def valid_moves(piece, square)
      @piece  = piece
      @square = square

      directions = [:top_left, :top, :top_right, :right, 
                    :bottom_right, :bottom, :bottom_left, :left]

      valid_moves = []

      directions.each do |direction|
        next_square = square.send(direction)
        if next_square 
          if next_square.empty?
            valid_moves << Move.make_a_simple_move(square, next_square)
          elsif next_square.has_a_piece_of_the_opposite_color?(piece)
            valid_moves << Move.make_a_capture_move(square, next_square)
          end
        end
      end

#      attacked_squares = calculate_attacked_squares

#      p attacked_squares.class
#      p valid_moves

#      if attacked_squares && !attacked_squares.empty?
#        valid_moves.select do |move|
#          attacked_positions = attacked_squares.map { |sq|
#            #sq.position 
#          }
#          if attacked_positions
#            attacked_positions.include?(move.destination) 
#          else
#            false
#          end
#        end
#      end

      valid_moves
    end

#    def calculate_attacked_squares
#      @square.get_squares_attacked_by_pieces_of_color(@piece.opposite_color)
#    end

  end

end
