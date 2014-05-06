module RubyChess

  class MoveStrategy
    attr_reader :strategies

    def initialize 
      @strategies = {
        king: KingMoveStrategy.new
      }
    end

    def self.by_name(name)
      MoveStrategy.new.by_name(name)
    end

    def by_name(name)
      @strategies[name]
    end

    def valid_moves(square)
      raise NotImplementedError, "Subclasses must override this method"
    end

  end

  class KingMoveStrategy < MoveStrategy
    
    def initialize
    end

    def valid_moves(piece, square)
      directions = ['top_left', 'top', 'top_right', 'right', 
                    'bottom_right', 'bottom', 'bottom_left', 'left']

      valid_moves = []

      directions.each do |direction|
        next_square = square.send("#{direction}")
        if next_square 
          if next_square.empty?
            valid_moves << Move.make_a_simple_move(square, next_square)
          elsif top_square.has_a_piece_of_the_opposite_color piece
            valid_moves << Move.make_a_capture_move(square, next_square)
          end
        end
      end

      valid_moves
    end
  end

end
