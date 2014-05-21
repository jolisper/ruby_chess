module RubyChess

  class Piece
    attr_reader :color, :name
    
    def initialize(name, color)
      @name            = name
      @color           = color
      @strategy        = MoveStrategy.by_name(@name)
      @first_move      = true
      @en_passant_risk = false     
      @square          = nil
    end

    def valid_moves
      @strategy.valid_moves(self, @square)
    end

    def influenced_squares
      @strategy.influenced_squares(self, @square)
    end

    def complete_name
      (@color.to_s + '_' + @name.to_s).to_sym
    end

    def opposite_color
      if color == :white
        :black
      else
        :white
      end
    end

    def move!(square)
      set_square! square
      @first_move = false
    end

    def set_square!(square)
      @square = square
    end

    def first_move?
      @first_move
    end

    def set_en_passant_risk_on!
      @en_passant_risk = true
    end

    def set_en_passant_risk_off!
      @en_passant_risk = false
    end

    def en_passant_risk?
      @en_passant_risk
    end

    # Factory methods
    def self.make_a_black_rook
      Piece.new :rook, :black
    end

    def self.make_a_black_knight
      Piece.new :knight, :black
    end

    def self.make_a_black_bishop
      Piece.new :bishop, :black
    end

    def self.make_a_black_queen
      Piece.new :queen, :black
    end

    def self.make_a_black_king
      Piece.new :king, :black
    end

    def self.make_a_black_pawn
      Piece.new :pawn, :black
    end

    def self.make_a_white_rook
      Piece.new :rook, :white
    end

    def self.make_a_white_knight
      Piece.new :knight, :white
    end

    def self.make_a_white_bishop
      Piece.new :bishop, :white
    end

    def self.make_a_white_queen
      Piece.new :queen, :white
    end

    def self.make_a_white_king
      Piece.new :king, :white
    end

    def self.make_a_white_pawn
      Piece.new :pawn, :white
    end

  end
end
