module RubyChess

  class Move
    attr_reader :origin, :destination

    def initialize(origin_square, destination_square)
      @origin      = origin_square.position
      @destination = destination_square.position
    end
    
    def execute
       raise NotImplementedError, "Subclasses must override this method"
    end

    def self.make_a_simple_move(origin_square, destination_square)
      Simple.new origin_square, destination_square
    end

    def self.make_a_capture_move(origin_square, destination_square)
      Capture.new origin_square, destination_square
    end

    def self.make_a_en_passant_capture_move(origin_square, destination_square, passant_square)
      EnPassantCapture.new origin_square, destination_square
    end

    def self.make_a_en_passant_risk_move(origin_square, destination_square)
      EnPassantRisk.new origin_square, destination_square
    end

    def self.make_a_promotion_move(origin_square, destination_square)
      Promotion.new origin_square, destination_square
    end
  end

  class Simple < Move
    def execute
      
    end
  end

  class Capture < Move
    def execute
      
    end
  end

  class Promotion < Move
    def execute

    end
  end

  class EnPassantCapture < Move
    def execute

    end
  end

  class EnPassantRisk < Move
    def execute

    end
  end


end
