module RubyChess

  class Square
    attr_accessor :top_left,
                  :top,
                  :top_right,
                  :right,
                  :bottom_right,
                  :bottom,
                  :bottom_left,
                  :left

    def initialize(position, chessboard)
      @position   = position
      @chessboard = chessboard
      @piece      = nil
      
      # links
      @top_left     = nil
      @top          = nil
      @top_right    = nil
      @right        = nil
      @bottom_right = nil
      @bottom       = nil
      @bottom_left  = nil
      @left         = nil
    end

    def position
      @position
    end

    def set_piece!(piece)
      piece.set_square! self
      if (empty?) 
        @piece = piece
        nil
      else
        @piece.dup.tap { |object| @piece = piece }
      end
    end
    
    def get_piece
      @piece
    end

    def has_a_piece_of_the_opposite_color?(piece)
      get_piece.color != piece.color 
    end

    def has_a_piece_of_the_same_color?(piece)
      get_piece.color == piece.color 
    end

    def empty?
      @piece == nil
    end

    def get_squares_attacked_by_pieces_of_color(color)
      @chessboard.squares_with(color)
    end

  end

end
