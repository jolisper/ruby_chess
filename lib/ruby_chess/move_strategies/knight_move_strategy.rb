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

      # The knight moves twice in the same direction...
      2.times do
        begin
          square = square.send(first_move) 
        rescue
          return []
        end
      end
      
      # And one to the two sides to form the "L"-shape move
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

    def influenced_squares(piece, square)
      @piece  = piece
      @square = square

      moves_top    = get_squares(:top,    [:left, :right])
      moves_bottom = get_squares(:bottom, [:left, :right])
      moves_left   = get_squares(:left,   [:top, :bottom])
      moves_right  = get_squares(:right,  [:top, :bottom])
      
      moves_top.concat(moves_bottom).concat(moves_left).concat(moves_right)
    end

    def get_squares(first_move, seconds_move)
      influenced_squares = []
      square = @square

      # The knight moves twice in the same direction...
      2.times do
        begin
          square = square.send(first_move)
        rescue
          return []
        end
      end
      
      # And one to the two sides to form the "L"-shape move
      if square
        seconds_move.each do |move|
          next_square = square.send(move)
          if next_square 
            influenced_squares << next_square
          end
        end
      end
            
      influenced_squares
    end

  end
end
