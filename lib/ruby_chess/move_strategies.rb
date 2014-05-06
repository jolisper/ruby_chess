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

end
