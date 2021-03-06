module RubyChess

  class BishopMoveStrategy < MoveStrategy

    def valid_moves(piece, square)
      directions = [:top_left, :top_right, :bottom_right, :bottom_left]
      
      valid_moves = []

      directions.each do |direction|
        next_square = square.send(direction)

        catch :no_more_moves_in_this_direction do
          while next_square
            if next_square.empty?
              valid_moves << Move.make_a_simple_move(square, next_square)
            elsif next_square.has_a_piece_of_the_opposite_color?(piece)
              valid_moves << Move.make_a_capture_move(square, next_square)
              # The rook may not jump over other pieces
              throw :no_more_moves_in_this_direction
            else
              # A piece of the same color is encountered in the path
              throw :no_more_moves_in_this_direction
            end
            next_square = next_square.send(direction)
          end
        end
      end

      valid_moves
    end

    def influenced_squares(piece, square)
      directions = [:top_left, :top_right, :bottom_right, :bottom_left]
      
      influenced_squares = []

      directions.each do |direction|
        next_square = square.send(direction)

        catch :no_more_moves_in_this_direction do
          while next_square
            if next_square.empty?
              influenced_squares << next_square
            elsif next_square.has_a_piece_of_the_opposite_color?(piece)
              influenced_squares << next_square
              # The rook may not jump over other pieces
              throw :no_more_moves_in_this_direction
            else
              # A piece of the same color is encountered in the path
              influenced_squares << next_square
              throw :no_more_moves_in_this_direction
            end
            next_square = next_square.send(direction)
          end
        end
      end

      influenced_squares
    end

  end

end
