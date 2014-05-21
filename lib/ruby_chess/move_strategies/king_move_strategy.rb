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
        if next_square && !next_square.influenced_by_opposite_color?(@piece) 
          if next_square.empty?
            valid_moves << Move.make_a_simple_move(square, next_square)
          elsif next_square.has_a_piece_of_the_opposite_color?(piece)
            valid_moves << Move.make_a_capture_move(square, next_square)
          end
        end
      end

      valid_moves
    end

    def influenced_squares(piece, square)
      @piece  = piece
      @square = square

      directions = [:top_left, :top, :top_right, :right, 
                    :bottom_right, :bottom, :bottom_left, :left]

      influenced_squares = []

      directions.each do |direction|
        next_square = square.send(direction)
        if next_square 
          influenced_squares << next_square
        end
      end
      
      influenced_squares
    end

  end

end
