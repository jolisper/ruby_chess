require 'spec_helper'
require 'ruby_chess'

describe Square do
  
  describe "when there is no piece on the square" do
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

  describe "when there is a piece on the square" do
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

end
