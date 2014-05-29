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

      add_castling_moves(valid_moves)

      valid_moves
    end

    def add_castling_moves(valid_moves)
      add_short_castling_move(valid_moves)
    end

    def add_short_castling_move(valid_moves)

      if @square.get_piece.first_move? && @square.position == :e1
        rook_square = @square
        3.times do 
          #puts rook_square.position
          rook_square = rook_square.rigth if rook_square
        end
        
        #if rook_square.first_move?
        #else
        #  return
        #end
      end
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
