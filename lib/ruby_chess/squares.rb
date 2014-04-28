module RubyChess

  class Square

    def initialize row, column
      @row = row
      @column = column
      @piece = nil
    end

    def position
      (@row.to_s + @column.to_s).to_sym
    end

    def set_piece!(piece)
      if (empty?) 
        @piece = piece
        nil
      else
        previous_piece = @piece.dup
        @piece = piece
        previous_piece
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
