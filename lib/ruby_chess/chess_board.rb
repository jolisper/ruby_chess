module RubyChess

  class ChessBoard
    attr_reader :squares, :rows, :columns

    def initialize
      @rows    = ['8', '7', '6', '5', '4', '3', '2', '1']
      @columns = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'] 
      
      create_squares
      link_squares
    end

    def create_squares
      @squares = {}
      rows.each do |row|
        columns.each do |column|
          coordinate = make_coordinate(row, column)
          @squares[coordinate] =  Square.new(coordinate, self)
        end
      end
      @squares.freeze
    end

    def link_squares
      rows.each do |row|
        columns.each do |column|
          coordinate = make_coordinate(row, column)
          square = @squares[coordinate]
          square.top_left     = @squares[make_coordinate(prev_item(rows, row), prev_item(columns, column))]
          square.top          = @squares[make_coordinate(prev_item(rows, row), column)]
          square.top_right    = @squares[make_coordinate(prev_item(rows, row), next_item(columns, column))]
          square.right        = @squares[make_coordinate(row, next_item(columns, column))]
          square.bottom_right = @squares[make_coordinate(next_item(rows, row), next_item(columns, column))]
          square.bottom       = @squares[make_coordinate(next_item(rows, row), column)]
          square.bottom_left  = @squares[make_coordinate(next_item(rows, row), prev_item(columns, column))]
          square.left         = @squares[make_coordinate(row, prev_item(columns, column))]
        end
      end
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

    def next_item(array, value)
      array[array.index(value) + 1]
    end

    def prev_item(array, value)
      prev_index = array.index(value) - 1
      if prev_index < 0 
        nil
      else
        array[prev_index]
      end
    end

    def make_coordinate(row, column)
      return (column + row).to_sym if row && column
      nil
    end

    def get_square_at(position)
      squares[position]
    end

    def get_piece_at(position)
      get_square_at(position).get_piece
    end

    def squares_with(color)
      squares = @squares.select do |k,v| 
        piece = v.get_piece
        if !piece
          false
        else
          #puts piece.color
          piece.color == color.to_sym
        end
      end

      squares.values if squares
    end

    private :squares,
            :put_pieces_in_starting_position,
            :get_square_at,
            :get_piece_at,
            :link_squares,
            :next_item,
            :prev_item

  end

end
