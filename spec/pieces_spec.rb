require 'spec_helper'
require 'ruby_chess'

include RubyChess

describe Piece do

  def find_move_by_destination(destination)
    @moves.find { |move| move.destination == destination }
  end

  def find_square_by_position(position)
    @squares.find { |square| square.position == position }
  end

  context "when King moves" do

    context "to empty squares" do
      before(:each) do
        chessboard = ChessBoard.new

        square = chessboard.send('get_square_at', :f5)
        square.set_piece! Piece.make_a_white_king

        @moves = square.get_piece.valid_moves
      end

      it "could move one to top left" do
        expect( find_move_by_destination(:e6) ).to be_instance_of(Simple)
      end

      it "could move one to top" do
        expect( find_move_by_destination(:f6) ).to be_instance_of(Simple)
      end

      it "could move one to top right" do
        expect( find_move_by_destination(:g6) ).to be_instance_of(Simple)
      end

      it "could move one to right" do
        expect( find_move_by_destination(:g5) ).to be_instance_of(Simple)
      end

      it "could move one to bottom right" do
        expect( find_move_by_destination(:g4) ).to be_instance_of(Simple)
      end                                   
      
      it "could move one to bottom" do      
        expect( find_move_by_destination(:f4) ).to be_instance_of(Simple)
      end                                   
      
      it "could move one to bottom left" do 
        expect( find_move_by_destination(:e4) ).to be_instance_of(Simple)
      end                                   
      
      it "could move one to left" do        
        expect( find_move_by_destination(:e5) ).to be_instance_of(Simple)
      end                                   
      
      it "could move one to top left" do
        expect( find_move_by_destination(:e6) ).to be_instance_of(Simple)
      end
    end

    context "to squares occupied by opposite pieces" do
      before(:each) do
        chessboard = ChessBoard.new

        king_square = chessboard.send('get_square_at', :f5)
        king_square.set_piece! Piece.make_a_white_king

        square = chessboard.send('get_square_at', :e6)
        square.set_piece! Piece.make_a_black_pawn

        square = chessboard.send('get_square_at', :f6)
        square.set_piece! Piece.make_a_black_pawn

        square = chessboard.send('get_square_at', :g6)
        square.set_piece! Piece.make_a_black_pawn

        square = chessboard.send('get_square_at', :g5)
        square.set_piece! Piece.make_a_black_pawn

        square = chessboard.send('get_square_at', :g4)
        square.set_piece! Piece.make_a_black_pawn

        square = chessboard.send('get_square_at', :f4)
        square.set_piece! Piece.make_a_black_pawn

        square = chessboard.send('get_square_at', :e4)
        square.set_piece! Piece.make_a_black_pawn

        square = chessboard.send('get_square_at', :e5)
        square.set_piece! Piece.make_a_black_pawn

        @moves = king_square.get_piece.valid_moves
      end

      it "could capture one to top left" do
        expect( find_move_by_destination(:e6) ).to be_instance_of(Capture)
      end

      it "could capture one to top" do
        expect( find_move_by_destination(:f6) ).to be_instance_of(Capture)
      end

      it "could capture one to top right" do
        expect( find_move_by_destination(:g6) ).to be_instance_of(Capture)
      end

      it "could capture one to right" do
        expect( find_move_by_destination(:g5) ).to be_instance_of(Capture)
      end

      it "could capture one to bottom right" do
        expect( find_move_by_destination(:g4) ).to be_instance_of(Capture)
      end                                   
      
      it "could capture one to bottom" do      
        expect( find_move_by_destination(:f4) ).to be_instance_of(Capture)
      end                                   
      
      it "could capture one to bottom left" do 
        expect( find_move_by_destination(:e4) ).to be_instance_of(Capture)
      end                                   
      
      it "could capture one to left" do        
        expect( find_move_by_destination(:e5) ).to be_instance_of(Capture)
      end                                   
      
    end

    context "when King is in a square" do
      before(:each) do
        chessboard = ChessBoard.new

        rook_square = chessboard.send('get_square_at', :f5)
        rook_square.set_piece! Piece.make_a_white_king

        chessboard.send('get_square_at', :e6).set_piece! Piece.make_a_black_pawn
        chessboard.send('get_square_at', :g6).set_piece! Piece.make_a_white_pawn
        chessboard.send('get_square_at', :e4).set_piece! Piece.make_a_black_pawn
        chessboard.send('get_square_at', :g4).set_piece! Piece.make_a_white_pawn

        @squares = rook_square.get_piece.influenced_squares
      end
      
      it "have influence on others squares" do
        find_square_by_position(:e6).should_not be(nil)
        find_square_by_position(:f6).should_not be(nil)
        find_square_by_position(:g6).should_not be(nil)
        find_square_by_position(:g5).should_not be(nil)
        find_square_by_position(:g4).should_not be(nil)
        find_square_by_position(:f4).should_not be(nil)
        find_square_by_position(:e4).should_not be(nil)
        find_square_by_position(:e5).should_not be(nil)
      end
      
    end

  end

  context "when Rook moves" do
    context "to empty squares" do
      before(:each) do
        chessboard = ChessBoard.new

        square = chessboard.send('get_square_at', :d5)
        square.set_piece! Piece.make_a_white_rook

        @moves = square.get_piece.valid_moves
      end

      it "could move until to the last square at the top" do
        expect( find_move_by_destination(:d6)).to be_instance_of(Simple)
        expect( find_move_by_destination(:d7)).to be_instance_of(Simple)
        expect( find_move_by_destination(:d8)).to be_instance_of(Simple)
      end

      it "could move until to the last square at the right" do
        expect( find_move_by_destination(:e5)).to be_instance_of(Simple)
        expect( find_move_by_destination(:f5)).to be_instance_of(Simple)
        expect( find_move_by_destination(:g5)).to be_instance_of(Simple)
        expect( find_move_by_destination(:h5)).to be_instance_of(Simple)
      end

      it "could move until to the last square at the bottom" do
        expect( find_move_by_destination(:d4)).to be_instance_of(Simple)
        expect( find_move_by_destination(:d3)).to be_instance_of(Simple)
        expect( find_move_by_destination(:d2)).to be_instance_of(Simple)
        expect( find_move_by_destination(:d1)).to be_instance_of(Simple)
      end

      it "could move until to the last square at the left" do
        expect( find_move_by_destination(:c5)).to be_instance_of(Simple)
        expect( find_move_by_destination(:b5)).to be_instance_of(Simple)
        expect( find_move_by_destination(:a5)).to be_instance_of(Simple)
      end

    end

    context "to squares occupied by opposite pieces" do

      before(:each) do
        chessboard = ChessBoard.new

        rook_square = chessboard.send('get_square_at', :d5)
        rook_square.set_piece! Piece.make_a_white_rook

        chessboard.send('get_square_at', :d8).set_piece! Piece.make_a_black_pawn
        chessboard.send('get_square_at', :h5).set_piece! Piece.make_a_black_pawn
        chessboard.send('get_square_at', :d1).set_piece! Piece.make_a_black_pawn
        chessboard.send('get_square_at', :a5).set_piece! Piece.make_a_black_pawn

        @moves = rook_square.get_piece.valid_moves
      end

      it "could capture at the top" do
        expect( find_move_by_destination(:d6)).to be_instance_of(Simple)
        expect( find_move_by_destination(:d7)).to be_instance_of(Simple)
        expect( find_move_by_destination(:d8)).to be_instance_of(Capture)
      end

      it "could capture at the right side" do
        expect( find_move_by_destination(:e5)).to be_instance_of(Simple)
        expect( find_move_by_destination(:f5)).to be_instance_of(Simple)
        expect( find_move_by_destination(:g5)).to be_instance_of(Simple)
        expect( find_move_by_destination(:h5)).to be_instance_of(Capture)
      end

      it "could capture at the bottom" do
        expect( find_move_by_destination(:d4)).to be_instance_of(Simple)
        expect( find_move_by_destination(:d3)).to be_instance_of(Simple)
        expect( find_move_by_destination(:d2)).to be_instance_of(Simple)
        expect( find_move_by_destination(:d1)).to be_instance_of(Capture)
      end

      it "could capture at the left side" do
        expect( find_move_by_destination(:c5)).to be_instance_of(Simple)
        expect( find_move_by_destination(:b5)).to be_instance_of(Simple)
        expect( find_move_by_destination(:a5)).to be_instance_of(Capture)
      end

    end

  end

  context "when Bishop moves" do
    context "to empty squares" do
      before(:each) do
        chessboard = ChessBoard.new

        square = chessboard.send('get_square_at', :d5)
        square.set_piece! Piece.make_a_white_bishop

        @moves = square.get_piece.valid_moves
      end

      it "could move until to the last square at the top-left side" do
        expect( find_move_by_destination(:c6)).to be_instance_of(Simple)
        expect( find_move_by_destination(:b7)).to be_instance_of(Simple)
        expect( find_move_by_destination(:a8)).to be_instance_of(Simple)
      end

      it "could move until to the last square at the top-right side" do
        expect( find_move_by_destination(:e6)).to be_instance_of(Simple)
        expect( find_move_by_destination(:f7)).to be_instance_of(Simple)
        expect( find_move_by_destination(:g8)).to be_instance_of(Simple)
      end

      it "could move until to the last square at the bottom-rigth side" do
        expect( find_move_by_destination(:e4)).to be_instance_of(Simple)
        expect( find_move_by_destination(:f3)).to be_instance_of(Simple)
        expect( find_move_by_destination(:g2)).to be_instance_of(Simple)
        expect( find_move_by_destination(:h1)).to be_instance_of(Simple)
      end

      it "could move until to the last square at the bottom-left side" do
        expect( find_move_by_destination(:c4)).to be_instance_of(Simple)
        expect( find_move_by_destination(:b3)).to be_instance_of(Simple)
        expect( find_move_by_destination(:a2)).to be_instance_of(Simple)
      end

    end

    context "to squares occupied by opposite pieces" do

      before(:each) do
        chessboard = ChessBoard.new

        rook_square = chessboard.send('get_square_at', :d5)
        rook_square.set_piece! Piece.make_a_white_bishop

        chessboard.send('get_square_at', :a8).set_piece! Piece.make_a_black_pawn
        chessboard.send('get_square_at', :g8).set_piece! Piece.make_a_black_pawn
        chessboard.send('get_square_at', :h1).set_piece! Piece.make_a_black_pawn
        chessboard.send('get_square_at', :a2).set_piece! Piece.make_a_black_pawn

        @moves = rook_square.get_piece.valid_moves
      end

      it "could capture at the top-left side" do
        expect( find_move_by_destination(:c6)).to be_instance_of(Simple)
        expect( find_move_by_destination(:b7)).to be_instance_of(Simple)
        expect( find_move_by_destination(:a8)).to be_instance_of(Capture)
      end

      it "could capture at the top-right side" do
        expect( find_move_by_destination(:e6)).to be_instance_of(Simple)
        expect( find_move_by_destination(:f7)).to be_instance_of(Simple)
        expect( find_move_by_destination(:g8)).to be_instance_of(Capture)
      end

      it "could capture at the bottom-right side" do
        expect( find_move_by_destination(:e4)).to be_instance_of(Simple)
        expect( find_move_by_destination(:f3)).to be_instance_of(Simple)
        expect( find_move_by_destination(:g2)).to be_instance_of(Simple)
        expect( find_move_by_destination(:h1)).to be_instance_of(Capture)
      end

      it "could capture at the bottom-left side" do
        expect( find_move_by_destination(:c4)).to be_instance_of(Simple)
        expect( find_move_by_destination(:b3)).to be_instance_of(Simple)
        expect( find_move_by_destination(:a2)).to be_instance_of(Capture)
      end

    end

    context "when Bishop is in a square" do
      before(:each) do
        chessboard = ChessBoard.new

        rook_square = chessboard.send('get_square_at', :d5)
        rook_square.set_piece! Piece.make_a_white_bishop

        chessboard.send('get_square_at', :a8).set_piece! Piece.make_a_black_pawn
        chessboard.send('get_square_at', :g8).set_piece! Piece.make_a_black_pawn
        chessboard.send('get_square_at', :h1).set_piece! Piece.make_a_black_pawn
        chessboard.send('get_square_at', :a2).set_piece! Piece.make_a_black_pawn

        @squares = rook_square.get_piece.influenced_squares
      end
      
      it "have influence on others squares" do
        find_square_by_position(:c6).should_not be(nil)
        find_square_by_position(:b7).should_not be(nil)
        find_square_by_position(:a8).should_not be(nil)

        find_square_by_position(:e6).should_not be(nil)
        find_square_by_position(:f7).should_not be(nil)
        find_square_by_position(:g8).should_not be(nil)

        find_square_by_position(:e4).should_not be(nil)
        find_square_by_position(:f3).should_not be(nil)
        find_square_by_position(:g2).should_not be(nil)
        find_square_by_position(:h1).should_not be(nil)

        find_square_by_position(:c4).should_not be(nil)
        find_square_by_position(:b3).should_not be(nil)
        find_square_by_position(:a2).should_not be(nil)
      end
      
    end
    
    context "when Queen moves" do
      context "to empty squares" do
        before(:each) do
          chessboard = ChessBoard.new

          square = chessboard.send('get_square_at', :d5)
          square.set_piece! Piece.make_a_white_queen

          @moves = square.get_piece.valid_moves
        end

        it "could move until to the last square at the top" do
          expect( find_move_by_destination(:d6)).to be_instance_of(Simple)
          expect( find_move_by_destination(:d7)).to be_instance_of(Simple)
          expect( find_move_by_destination(:d8)).to be_instance_of(Simple)
        end

        it "could move until to the last square at the right" do
          expect( find_move_by_destination(:e5)).to be_instance_of(Simple)
          expect( find_move_by_destination(:f5)).to be_instance_of(Simple)
          expect( find_move_by_destination(:g5)).to be_instance_of(Simple)
          expect( find_move_by_destination(:h5)).to be_instance_of(Simple)
        end

        it "could move until to the last square at theppp bottom" do
          expect( find_move_by_destination(:d4)).to be_instance_of(Simple)
          expect( find_move_by_destination(:d3)).to be_instance_of(Simple)
          expect( find_move_by_destination(:d2)).to be_instance_of(Simple)
          expect( find_move_by_destination(:d1)).to be_instance_of(Simple)
        end

        it "could move until to the last square at the left" do
          expect( find_move_by_destination(:c5)).to be_instance_of(Simple)
          expect( find_move_by_destination(:b5)).to be_instance_of(Simple)
          expect( find_move_by_destination(:a5)).to be_instance_of(Simple)
        end

        it "could move until to the last square at the top-left side" do
          expect( find_move_by_destination(:c6)).to be_instance_of(Simple)
          expect( find_move_by_destination(:b7)).to be_instance_of(Simple)
          expect( find_move_by_destination(:a8)).to be_instance_of(Simple)
        end

        it "could move until to the last square at the top-right side" do
          expect( find_move_by_destination(:e6)).to be_instance_of(Simple)
          expect( find_move_by_destination(:f7)).to be_instance_of(Simple)
          expect( find_move_by_destination(:g8)).to be_instance_of(Simple)
        end

        it "could move until to the last square at the bottom-rigth side" do
          expect( find_move_by_destination(:e4)).to be_instance_of(Simple)
          expect( find_move_by_destination(:f3)).to be_instance_of(Simple)
          expect( find_move_by_destination(:g2)).to be_instance_of(Simple)
          expect( find_move_by_destination(:h1)).to be_instance_of(Simple)
        end

        it "could move until to the last square at the bottom-left side" do
          expect( find_move_by_destination(:c4)).to be_instance_of(Simple)
          expect( find_move_by_destination(:b3)).to be_instance_of(Simple)
          expect( find_move_by_destination(:a2)).to be_instance_of(Simple)
        end

      end

      context "to squares occupied by opposite pieces" do

        before(:each) do
          chessboard = ChessBoard.new

          rook_square = chessboard.send('get_square_at', :d5)
          rook_square.set_piece! Piece.make_a_white_queen

          chessboard.send('get_square_at', :a8).set_piece! Piece.make_a_black_pawn
          chessboard.send('get_square_at', :g8).set_piece! Piece.make_a_black_pawn
          chessboard.send('get_square_at', :h1).set_piece! Piece.make_a_black_pawn
          chessboard.send('get_square_at', :a2).set_piece! Piece.make_a_black_pawn

          chessboard.send('get_square_at', :d8).set_piece! Piece.make_a_black_pawn
          chessboard.send('get_square_at', :h5).set_piece! Piece.make_a_black_pawn
          chessboard.send('get_square_at', :d1).set_piece! Piece.make_a_black_pawn
          chessboard.send('get_square_at', :a5).set_piece! Piece.make_a_black_pawn

          @moves = rook_square.get_piece.valid_moves
        end

        it "could capture at the top" do
          expect( find_move_by_destination(:d6)).to be_instance_of(Simple)
          expect( find_move_by_destination(:d7)).to be_instance_of(Simple)
          expect( find_move_by_destination(:d8)).to be_instance_of(Capture)
        end

        it "could capture at the right side" do
          expect( find_move_by_destination(:e5)).to be_instance_of(Simple)
          expect( find_move_by_destination(:f5)).to be_instance_of(Simple)
          expect( find_move_by_destination(:g5)).to be_instance_of(Simple)
          expect( find_move_by_destination(:h5)).to be_instance_of(Capture)
        end

        it "could capture at the bottom" do
          expect( find_move_by_destination(:d4)).to be_instance_of(Simple)
          expect( find_move_by_destination(:d3)).to be_instance_of(Simple)
          expect( find_move_by_destination(:d2)).to be_instance_of(Simple)
          expect( find_move_by_destination(:d1)).to be_instance_of(Capture)
        end

        it "could capture at the left side" do
          expect( find_move_by_destination(:c5)).to be_instance_of(Simple)
          expect( find_move_by_destination(:b5)).to be_instance_of(Simple)
          expect( find_move_by_destination(:a5)).to be_instance_of(Capture)
        end

        it "could capture at the top-left side" do
          expect( find_move_by_destination(:c6)).to be_instance_of(Simple)
          expect( find_move_by_destination(:b7)).to be_instance_of(Simple)
          expect( find_move_by_destination(:a8)).to be_instance_of(Capture)
        end

        it "could capture at the top-right side" do
          expect( find_move_by_destination(:e6)).to be_instance_of(Simple)
          expect( find_move_by_destination(:f7)).to be_instance_of(Simple)
          expect( find_move_by_destination(:g8)).to be_instance_of(Capture)
        end

        it "could capture at the bottom-right side" do
          expect( find_move_by_destination(:e4)).to be_instance_of(Simple)
          expect( find_move_by_destination(:f3)).to be_instance_of(Simple)
          expect( find_move_by_destination(:g2)).to be_instance_of(Simple)
          expect( find_move_by_destination(:h1)).to be_instance_of(Capture)
        end

        it "could capture at the bottom-left side" do
          expect( find_move_by_destination(:c4)).to be_instance_of(Simple)
          expect( find_move_by_destination(:b3)).to be_instance_of(Simple)
          expect( find_move_by_destination(:a2)).to be_instance_of(Capture)
        end

      end

    end

    context "when Knight moves" do
      context "to empty squares" do
        before(:each) do
          chessboard = ChessBoard.new

          square = chessboard.send('get_square_at', :d4)
          square.set_piece! Piece.make_a_white_knight

          @moves = square.get_piece.valid_moves
        end

        it "could jump to buttom top-left side" do
          expect( find_move_by_destination(:b5)).to be_instance_of(Simple)
        end

        it "could jump to top top-left side" do
          expect( find_move_by_destination(:c6)).to be_instance_of(Simple)
        end

        it "could jump to top top-right side" do
          expect( find_move_by_destination(:e6)).to be_instance_of(Simple)
        end

        it "could jump to buttom top-rigth side" do
          expect( find_move_by_destination(:f5)).to be_instance_of(Simple)
        end

        it "could jump to top bottom-rigth side" do
          expect( find_move_by_destination(:f3)).to be_instance_of(Simple)
        end

        it "could jump to buttom bottom-rigth side" do
          expect( find_move_by_destination(:e2)).to be_instance_of(Simple)
        end

        it "could jump to top bottom-left side" do
          expect( find_move_by_destination(:c2)).to be_instance_of(Simple)
        end

        it "could jump to buttom bottom-left side" do
          expect( find_move_by_destination(:b3)).to be_instance_of(Simple)
        end

      end

      context "to squares occupied by opposite pieces" do

        before(:each) do
          chessboard = ChessBoard.new

          rook_square = chessboard.send('get_square_at', :d4)
          rook_square.set_piece! Piece.make_a_white_knight

          chessboard.send('get_square_at', :b5).set_piece! Piece.make_a_black_pawn
          chessboard.send('get_square_at', :c6).set_piece! Piece.make_a_black_pawn
          chessboard.send('get_square_at', :e6).set_piece! Piece.make_a_black_pawn
          chessboard.send('get_square_at', :f5).set_piece! Piece.make_a_black_pawn
          chessboard.send('get_square_at', :f3).set_piece! Piece.make_a_black_pawn
          chessboard.send('get_square_at', :e2).set_piece! Piece.make_a_black_pawn
          chessboard.send('get_square_at', :c2).set_piece! Piece.make_a_black_pawn
          chessboard.send('get_square_at', :b3).set_piece! Piece.make_a_black_pawn

          @moves = rook_square.get_piece.valid_moves
        end

        it "could capture to bottom top-left side" do
          expect( find_move_by_destination(:b5)).to be_instance_of(Capture)
        end

        it "could capture to top top-left side" do
          expect( find_move_by_destination(:c6)).to be_instance_of(Capture)
        end

        it "could capture to top top-right side" do
          expect( find_move_by_destination(:e6)).to be_instance_of(Capture)
        end

        it "could capture to bottom top-rigth side" do
          expect( find_move_by_destination(:f5)).to be_instance_of(Capture)
        end

        it "could capture to top bottom-rigth side" do
          expect( find_move_by_destination(:f3)).to be_instance_of(Capture)
        end

        it "could capture to bottom bottom-rigth side" do
          expect( find_move_by_destination(:e2)).to be_instance_of(Capture)
        end

        it "could capture to top bottom-left side" do
          expect( find_move_by_destination(:c2)).to be_instance_of(Capture)
        end

        it "could capture to bottom bottom-left side" do
          expect( find_move_by_destination(:b3)).to be_instance_of(Capture)
        end

      end

    end

    context "when Pawn moves" do
      context "to empty squares" do
        before(:each) do
          chessboard = ChessBoard.new

          square = chessboard.send('get_square_at', :f2)
          square.set_piece! Piece.make_a_white_pawn

          @moves = square.get_piece.valid_moves
        end

        it "could move one to the front" do
          expect(find_move_by_destination(:f3)).to be_instance_of(Simple)
        end

        it "could move two to the front if is the first move" do
          expect(find_move_by_destination(:f4)).to be_instance_of(EnPassantRisk)
        end

      end

      context "to squares occupied by opposite pieces (diagonally)" do

        before(:each) do
          chessboard = ChessBoard.new

          square = chessboard.send('get_square_at', :f2)
          square.set_piece! Piece.make_a_white_pawn

          chessboard.send('get_square_at', :e3).set_piece! Piece.make_a_black_pawn
          chessboard.send('get_square_at', :g3).set_piece! Piece.make_a_black_pawn

          @moves = square.get_piece.valid_moves
        end

        it "could capture at top-left side" do
          expect(find_move_by_destination(:e3)).to be_instance_of(Capture)
        end

        it "could capture at top-right side" do
          expect(find_move_by_destination(:g3)).to be_instance_of(Capture)
        end

      end

      context "diagonally and have to the side a pawn in en passant risk" do

        before(:each) do
          chessboard = ChessBoard.new

          square = chessboard.send('get_square_at', :f5)
          square.set_piece! Piece.make_a_white_pawn

          black_pawn_one = Piece.make_a_black_pawn
          black_pawn_two = Piece.make_a_black_pawn

          black_pawn_one.set_en_passant_risk_on!
          black_pawn_two.set_en_passant_risk_on!

          chessboard.send('get_square_at', :e5).set_piece! black_pawn_one
          chessboard.send('get_square_at', :g5).set_piece! black_pawn_two

          @moves = square.get_piece.valid_moves
        end

        it "could capture at top-left side" do
          expect(find_move_by_destination(:e6)).to be_instance_of(EnPassantCapture)
        end

        it "could capture at top-right side" do
          expect(find_move_by_destination(:g6)).to be_instance_of(EnPassantCapture)
        end

      end

      context "to the last rank " do
        before(:each) do
          chessboard = ChessBoard.new

          white_pawn_square = chessboard.send('get_square_at', :c7)
          white_pawn_square.set_piece! Piece.make_a_white_pawn
          
          @white_pawn_moves = 
            white_pawn_square.get_piece.valid_moves

          black_pawn_square = chessboard.send('get_square_at', :c2)
          black_pawn_square.set_piece! Piece.make_a_black_pawn
          
          @black_pawn_moves = 
            black_pawn_square.get_piece.valid_moves
        end
        
        it "it is promoted to white Queen" do
          move = @white_pawn_moves.find do |move|
            move.destination == :c8 && move.is_a?(Promotion)
          end
          expect(move).to be_a Promotion
        end

        it "it is promoted to black Queen" do
          move = @black_pawn_moves.find do |move|
            move.destination == :c1 && move.is_a?(Promotion)
          end
          expect(move).to be_a Promotion
        end

      end

    end

    context "when white Pawn is in a square" do
      before(:each) do
        chessboard = ChessBoard.new
        
        square = chessboard.send('get_square_at', :f2)
        square.set_piece! Piece.make_a_white_pawn

        square = chessboard.send('get_square_at', :e3)
        square.set_piece! Piece.make_a_white_pawn

        square = chessboard.send('get_square_at', :g3)
        square.set_piece! Piece.make_a_white_pawn

        @defending_pawn = chessboard.send('get_square_at', :f2).get_piece
        @offending_pawn = chessboard.send('get_square_at', :e3).get_piece
      end

      it "have influence on others squares" do
        influenced_squares = @offending_pawn.influenced_squares
        position_one = influenced_squares.find { |p| p.position == :d4 }
        position_two = influenced_squares.find { |p| p.position == :f4 }

        expect(position_one.position).to be(:d4)
        expect(position_two.position).to be(:f4)

        influenced_positions = @defending_pawn.influenced_squares
        position_one = influenced_positions.find { |p| p.position == :e3 }
        position_two = influenced_positions.find { |p| p.position == :g3 }

        expect(position_one.position).to be(:e3)
        expect(position_two.position).to be(:g3)
      end

    end

    context "when black Pawn is in a square" do
      before(:each) do
        chessboard = ChessBoard.new
        
        square = chessboard.send('get_square_at', :c7)
        square.set_piece! Piece.make_a_black_pawn

        square = chessboard.send('get_square_at', :b6)
        square.set_piece! Piece.make_a_black_pawn

        square = chessboard.send('get_square_at', :d6)
        square.set_piece! Piece.make_a_black_pawn

        @defending_pawn = chessboard.send('get_square_at', :c7).get_piece
        @offending_pawn = chessboard.send('get_square_at', :b6).get_piece
      end

      it "have influence on others squares" do
        influenced_squares = @offending_pawn.influenced_squares

        position_one = influenced_squares.find { |p| p.position == :a5 }
        position_two = influenced_squares.find { |p| p.position == :c5 }

        expect(position_one.position).to be(:a5)
        expect(position_two.position).to be(:c5)
        
        influenced_squares = @defending_pawn.influenced_squares

        position_one = influenced_squares.find { |p| p.position == :b6 }
        position_two = influenced_squares.find { |p| p.position == :d6 }
        
        expect(position_one.position).to be(:b6)
        expect(position_two.position).to be(:d6)
      end
      
    end

  end

end
