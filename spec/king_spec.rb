require 'spec_helper'
require 'ruby_chess'

include RubyChess

describe Piece, "King" do

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

      it "could not capture one to right (attacked square)" do
        expect( find_move_by_destination(:g5) ).to be(nil)
      end

      it "could capture one to bottom right" do
        expect( find_move_by_destination(:g4) ).to be_instance_of(Capture)
      end                                   
      
      it "could not capture one to bottom (attaked square)" do      
        expect( find_move_by_destination(:f4) ).to be(nil)
      end                                   
      
      it "could capture one to bottom left" do 
        expect( find_move_by_destination(:e4) ).to be_instance_of(Capture)
      end                                   
      
      it "could not capture one to left (attacked square)" do        
        expect( find_move_by_destination(:e5) ).to be(nil)
      end                                   
      
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
