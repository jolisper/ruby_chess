module RubyChess

  class ChessBoard
    attr_reader :squares

    def initialize
      @squares = []
      (8).downto(1) do |row|
        ('a').upto('h') do |column|
          @squares << Square.new(row, column.to_sym)
        end
      end
      @squares.freeze
    end

    def new_game
      put_pieces_in_starting_position
      true
    end

    def put_pieces_in_starting_position
      # Black pieces
      get_square_at(8, :a).set_piece! Piece.make_a_black_rook
      get_square_at(8, :b).set_piece! Piece.make_a_black_knight
      get_square_at(8, :c).set_piece! Piece.make_a_black_bishop
      get_square_at(8, :d).set_piece! Piece.make_a_black_queen
      get_square_at(8, :e).set_piece! Piece.make_a_black_king
      get_square_at(8, :f).set_piece! Piece.make_a_black_bishop
      get_square_at(8, :g).set_piece! Piece.make_a_black_knight
      get_square_at(8, :h).set_piece! Piece.make_a_black_rook

      get_square_at(7, :a).set_piece! Piece.make_a_black_pawn
      get_square_at(7, :b).set_piece! Piece.make_a_black_pawn
      get_square_at(7, :c).set_piece! Piece.make_a_black_pawn
      get_square_at(7, :d).set_piece! Piece.make_a_black_pawn
      get_square_at(7, :e).set_piece! Piece.make_a_black_pawn
      get_square_at(7, :f).set_piece! Piece.make_a_black_pawn
      get_square_at(7, :g).set_piece! Piece.make_a_black_pawn
      get_square_at(7, :h).set_piece! Piece.make_a_black_pawn

      # White pieces
      get_square_at(2, :a).set_piece! Piece.make_a_white_pawn
      get_square_at(2, :b).set_piece! Piece.make_a_white_pawn
      get_square_at(2, :c).set_piece! Piece.make_a_white_pawn
      get_square_at(2, :d).set_piece! Piece.make_a_white_pawn
      get_square_at(2, :e).set_piece! Piece.make_a_white_pawn
      get_square_at(2, :f).set_piece! Piece.make_a_white_pawn
      get_square_at(2, :g).set_piece! Piece.make_a_white_pawn
      get_square_at(2, :h).set_piece! Piece.make_a_white_pawn  

      get_square_at(1, :a).set_piece! Piece.make_a_white_rook
      get_square_at(1, :b).set_piece! Piece.make_a_white_knight
      get_square_at(1, :c).set_piece! Piece.make_a_white_bishop
      get_square_at(1, :d).set_piece! Piece.make_a_white_queen
      get_square_at(1, :e).set_piece! Piece.make_a_white_king
      get_square_at(1, :f).set_piece! Piece.make_a_white_bishop
      get_square_at(1, :g).set_piece! Piece.make_a_white_knight
      get_square_at(1, :h).set_piece! Piece.make_a_white_rook
    end
    
    def get_square_at(row, column)
      @squares.find do |square|
        square.position == (row.to_s + column.to_s).to_sym
      end
    end

    def get_piece_at(row, column)
      get_square_at(row, column).get_piece
    end

    private :squares,
            :put_pieces_in_starting_position,
            :get_square_at, 
            :get_piece_at

  end

end
