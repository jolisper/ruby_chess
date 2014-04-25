module RubyChess

  class Square

    def initialize row, column
      @row = row
      @column = column
    end

    def position?(row, column)
      @row == row && @column == column
    end
  end

  class ChessBoard
    attr_reader :squares

    def initialize
      @squares = []
      (8).downto(1) do |row|
        ('a').upto('h') do |column|
          @squares << Square.new(row, column)
        end
      end 
    end

  end
end
