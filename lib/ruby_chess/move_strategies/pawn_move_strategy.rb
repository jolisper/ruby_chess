module RubyChess
  
  class PawnMoveStrategy < MoveStrategy
    
    def valid_moves(piece, square)
      @piece  = piece
      @square = square

      if piece.color == :white
        @basic_direction = :top
        @attack_directions = [:top_left, :top_right]
      else
        @basic_direction = :bottom
        @attack_directions = [:bottom_left, :bottom_right]
      end

      calculate_moves
    end

    def calculate_moves
      valid_moves = []

      # The pawn moves one square to the front, or two if is the first move
      calculate_front_moves(valid_moves)

      # The pawn attacks diagonally...
      calculate_attack_moves(valid_moves)

      # The "en passant" special capture
      calculate_en_passant_captures(valid_moves)

      # The pawn could be promoted
      calculate_promoted_moves(valid_moves)

      valid_moves
    end

    def calculate_front_moves(valid_moves)
      next_square = @square.send(@basic_direction)
      if next_square
        if next_square.empty?
          valid_moves << Move.make_a_simple_move(@square, next_square)
        end
        
        if @piece.first_move?
          next_square = next_square.send(@basic_direction)
          if next_square && next_square.empty?
            valid_moves << Move.make_a_en_passant_risk_move(@square, next_square)
          end
        end
      end
    end

    def calculate_attack_moves(valid_moves)
      @attack_directions.each do |attack_direction|
        next_square = @square.send(attack_direction)
        if next_square
           if !next_square.empty? && next_square.has_a_piece_of_the_opposite_color?(@piece)
            valid_moves << Move.make_a_capture_move(@square, next_square)
          end
        end
      end
    end

    def calculate_en_passant_captures(valid_moves)
      directions = [:left, :right]
      index = 0
      @attack_directions.each do |attack_direction|
        diagonal_square = @square.send(attack_direction)

        if diagonal_square && diagonal_square.empty? 
          side_square = @square.send(directions[index])

          if side_square && 
              !side_square.empty? && 
              side_square.has_a_piece_of_the_opposite_color?(@piece)

            piece = side_square.get_piece
            
            if piece.name == :pawn && piece.en_passant_risk? 
              valid_moves << Move.make_a_en_passant_capture_move(@square, diagonal_square, side_square)
            end
          end
        end
        index += 1
      end
    end

    def calculate_promoted_moves(valid_moves)
      next_square = @square.send(@basic_direction)
      if next_square
        is_last_rank = next_square.position.to_s.reverse.start_with?('8', '1')
        if next_square.empty? && is_last_rank
          valid_moves << Move.make_a_promotion_move(@square, next_square)
        end
      end
    end
 
  end
  
end
