require 'spec_helper'
require 'ruby_chess'

include RubyChess

describe Piece do

  def find_move_by_destination(destination)
    @moves.find { |move| move.destination == destination }
  end

  context "when King moves" do

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

  context "when Rook moves" do
    context "to empty squares" do
      before(:each) do
        chessboard = ChessBoard.new

        square = chessboard.send('get_square_at', :d5)
        square.set_piece! Piece.make_a_white_rook

        @moves = square.get_piece.valid_moves(square)
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

        @moves = rook_square.get_piece.valid_moves(rook_square)
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

        @moves = square.get_piece.valid_moves(square)
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

        @moves = rook_square.get_piece.valid_moves(rook_square)
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

  context "when Queen moves" do
    context "to empty squares" do
      before(:each) do
        chessboard = ChessBoard.new

        square = chessboard.send('get_square_at', :d5)
        square.set_piece! Piece.make_a_white_queen

        @moves = square.get_piece.valid_moves(square)
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

        @moves = rook_square.get_piece.valid_moves(rook_square)
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

end

