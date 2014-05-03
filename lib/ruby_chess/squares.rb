module RubyChess

  class Square

    def initialize position
      @position = position
      @piece = nil
    end

    def position
      @position
    end

    def set_piece!(piece)
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

    def empty?
      @piece == nil
    end

  end

end
