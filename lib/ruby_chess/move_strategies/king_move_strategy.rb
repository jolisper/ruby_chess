module RubyChess

  class KingMoveStrategy < MoveStrategy

    def valid_moves(piece, square)
      directions = ['top_left', 'top', 'top_right', 'right', 
                    'bottom_right', 'bottom', 'bottom_left', 'left']

      valid_moves = []

      directions.each do |direction|
        next_square = square.send("#{direction}")
        if next_square 
          if next_square.empty?
            valid_moves << Move.make_a_simple_move(square, next_square)
          elsif next_square.has_a_piece_of_the_opposite_color?(piece)
            valid_moves << Move.make_a_capture_move(square, next_square)
          end
        end
      end

      valid_moves
    end
  end

end
