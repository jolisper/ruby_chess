module RubyChess

  class MoveStrategy
    attr_reader :strategies

    def initialize 
      @strategies = {
        king: KingMoveStrategy,
        rook: RookMoveStrategy,
        bishop: BishopMoveStrategy,
        queen: QueenMoveStrategy,
        knight: KnightMoveStrategy
      }
    end

    def self.by_name(name)
      MoveStrategy.new.by_name(name)
    end

    def by_name(name)
      @strategies[name] ? @strategies[name].new : MoveStrategy.new
    end

    def valid_moves(piece, square)
      raise NotImplementedError, "Subclasses must override this method"
    end

  end

end
