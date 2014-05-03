module RubyChess

  class PieceMover
    def initialize squares
      @squares = squares
    end
  end

  class ChessBoard
    attr_reader :squares

    def initialize
      @squares = []
      (8).downto(1) do |row|
        ('a').upto('h') do |column|
          @squares << Square.new((column + row.to_s).to_sym)
        end
      end
      @squares.freeze
      @piece_mover = PieceMover.new(@squares)
    end

    def new_game
      put_pieces_in_starting_position
      true
    end

    def put_pieces_in_starting_position
      # Black pieces
      get_square_at(:a8).set_piece! Piece.make_a_black_rook
      get_square_at(:b8).set_piece! Piece.make_a_black_knight
      get_square_at(:c8).set_piece! Piece.make_a_black_bishop
      get_square_at(:d8).set_piece! Piece.make_a_black_queen
      get_square_at(:e8).set_piece! Piece.make_a_black_king
      get_square_at(:f8).set_piece! Piece.make_a_black_bishop
      get_square_at(:g8).set_piece! Piece.make_a_black_knight
      get_square_at(:h8).set_piece! Piece.make_a_black_rook

      get_square_at(:a7).set_piece! Piece.make_a_black_pawn
      get_square_at(:b7).set_piece! Piece.make_a_black_pawn
      get_square_at(:c7).set_piece! Piece.make_a_black_pawn
      get_square_at(:d7).set_piece! Piece.make_a_black_pawn
      get_square_at(:e7).set_piece! Piece.make_a_black_pawn
      get_square_at(:f7).set_piece! Piece.make_a_black_pawn
      get_square_at(:g7).set_piece! Piece.make_a_black_pawn
      get_square_at(:h7).set_piece! Piece.make_a_black_pawn

      # White pieces
      get_square_at(:a2).set_piece! Piece.make_a_white_pawn
      get_square_at(:b2).set_piece! Piece.make_a_white_pawn
      get_square_at(:c2).set_piece! Piece.make_a_white_pawn
      get_square_at(:d2).set_piece! Piece.make_a_white_pawn
      get_square_at(:e2).set_piece! Piece.make_a_white_pawn
      get_square_at(:f2).set_piece! Piece.make_a_white_pawn
      get_square_at(:g2).set_piece! Piece.make_a_white_pawn
      get_square_at(:h2).set_piece! Piece.make_a_white_pawn  

      get_square_at(:a1).set_piece! Piece.make_a_white_rook
      get_square_at(:b1).set_piece! Piece.make_a_white_knight
      get_square_at(:c1).set_piece! Piece.make_a_white_bishop
      get_square_at(:d1).set_piece! Piece.make_a_white_queen
      get_square_at(:e1).set_piece! Piece.make_a_white_king
      get_square_at(:f1).set_piece! Piece.make_a_white_bishop
      get_square_at(:g1).set_piece! Piece.make_a_white_knight
      get_square_at(:h1).set_piece! Piece.make_a_white_rook
    end
    
    def get_square_at(position)
      squares.find do |square|
        square.position == position
      end
    end

    def get_piece_at(position)
      get_square_at(position).get_piece
    end

    private :squares,
            :put_pieces_in_starting_position,
            :get_square_at, 
            :get_piece_at

  end

end
