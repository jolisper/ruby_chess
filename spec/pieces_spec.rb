require 'spec_helper'
require 'ruby_chess'

include RubyChess

describe Piece do
  context "when King moves" do
    def find_move_by_destination(destination)
      @moves.find { |move| move.destination == destination }
    end

    context "to empty squares" do
      before(:each) do
        chessboard = ChessBoard.new

        square = chessboard.send('get_square_at', :f5)
        square.set_piece! Piece.make_a_white_king

        @moves = square.get_piece.valid_moves(square)
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

        @moves = king_square.get_piece.valid_moves(king_square)
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

  end
end

