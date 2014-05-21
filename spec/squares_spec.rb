require 'spec_helper'
require 'ruby_chess'

describe Square do
  
  context "when there is no piece on the square" do
    before(:each) { @square = Square.new(:h8, ChessBoard.new) }

    it "#empty? returns true" do
      expect(@square.empty?).to be(true)
    end

    it "#set_piece! put the piece on the square and returns nil" do
      expect(@square.set_piece! Piece.make_a_white_pawn).to be(nil)
    end

    it "#set_piece! put the square in not empty state" do
      @square.set_piece! Piece.make_a_white_pawn
      expect(@square.empty?).to be(false)
    end

  end

  context "when there is a piece on the square" do
    before(:each) { 
      @square = Square.new(:h8, ChessBoard.new) 
      @square.set_piece! Piece.make_a_white_pawn
    }
    
    it "#empty? returns false" do
      expect(@square.empty?).to be(false)
    end

    it "#set_piece! put the piece on the square and returns the previous one" do
      previous_piece = @square.set_piece! Piece.make_a_white_king      
      expect(previous_piece.complete_name).to be(:white_pawn)
    end


  end

#  context "bla bla" do
#    before(:each) { 
#      chessboard = ChessBoard.new
#      chessboard.new_game
#      @square = Square.new(:h8, chessboard) 
#      @square.set_piece! Piece.make_a_white_pawn
#    }

#    it "#get_squares_attacked_by_pieces_of_color(:color) returns all the squares attacked by pieces of color :color" do
#      pieces = @square.get_squares_attacked_by_pieces_of_color(:black)
#     pieces
#  end
#    
#  end

end
