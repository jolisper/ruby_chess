module RubyChess
  class KnightMoveStrategy < MoveStrategy

    def valid_moves(piece, square)
      @piece  = piece
      @square = square

      moves_top    = make_moves(:top,    [:left, :right])
      moves_bottom = make_moves(:bottom, [:left, :right])
      moves_left   = make_moves(:left,   [:top, :bottom])
      moves_right  = make_moves(:right,  [:top, :bottom])
      
      moves_top.concat(moves_bottom).concat(moves_left).concat(moves_right)
    end

    def make_moves(first_move, seconds_move)
      valid_moves = []
      square = @square

      2.times do
        square = square.send(first_move) if square
      end
      
      if square
        seconds_move.each do |move|
          next_square = square.send(move)
          if next_square 
            if next_square.empty?
              valid_moves << Move.make_a_simple_move(@square, next_square)
            elsif next_square.has_a_piece_of_the_opposite_color?(@piece)
              valid_moves << Move.make_a_capture_move(@square, next_square)
            end
          end
        end
      end
            
      valid_moves
    end

  end
end
