require 'spec_helper'
require 'ruby_chess'

include RubyChess

describe ChessBoard do
  
  before(:each) do
    @chessboard = ChessBoard.new
  end

  it "has 64 squares" do
    expect(@chessboard).to have(64).squares
  end

  it "top left square is the a8 square" do
    square = @chessboard.instance_variable_get(:@squares).first
    expect(square.position).to be(:a8)
  end

  it "botton right square is the h1 square" do
    square = @chessboard.instance_variable_get(:@squares).last
    expect(square.position).to be(:h1)
  end

  context "when new game is started" do
    before(:each) { 
      @chessboard = ChessBoard.new
      @chessboard.new_game
    }

    it "#new_game returns true" do
      expect(@chessboard.new_game).to be(true)
    end

    it "a black rook is in the a8 position" do
      piece = @chessboard.send('get_piece_at', :a8)
      expect(piece.complete_name).to be(:black_rook)
    end

    it "a black knight is in the b8 position" do
      piece = @chessboard.send('get_piece_at', :b8)
      expect(piece.complete_name).to be(:black_knight)
    end

    it "a black bishop is in the c8 position" do
      piece = @chessboard.send('get_piece_at', :c8)
      expect(piece.complete_name).to be(:black_bishop)
    end

    it "the black queen is in the d8 position" do
      piece = @chessboard.send('get_piece_at', :d8)
      expect(piece.complete_name).to be(:black_queen)
    end

    it "the black king is in the e8 position" do
      piece = @chessboard.send('get_piece_at', :e8)
      expect(piece.complete_name).to be(:black_king)
    end

    it "a black bishop is in the f8 position" do
      piece = @chessboard.send('get_piece_at', :f8)
      expect(piece.complete_name).to be(:black_bishop)
    end

    it "a black knight is in the g8 position" do
      piece = @chessboard.send('get_piece_at', :g8)
      expect(piece.complete_name).to be(:black_knight)
    end

    it "a black rook is in the h8 position" do
      piece = @chessboard.send('get_piece_at', :h8)
      expect(piece.complete_name).to be(:black_rook)
    end

    it "a black pawn is in the a7 position" do
      piece = @chessboard.send('get_piece_at', :a7)
      expect(piece.complete_name).to be(:black_pawn)
    end

    it "a black pawn is in the b7 position" do
      piece = @chessboard.send('get_piece_at', :b7)
      expect(piece.complete_name).to be(:black_pawn)
    end

    it "a black pawn is in the c7 position" do
      piece = @chessboard.send('get_piece_at', :c7)
      expect(piece.complete_name).to be(:black_pawn)
    end

    it "a black pawn is in the d7 position" do
      piece = @chessboard.send('get_piece_at', :d7)
      expect(piece.complete_name).to be(:black_pawn)
    end

    it "a black pawn is in the e7 position" do
      piece = @chessboard.send('get_piece_at', :e7)
      expect(piece.complete_name).to be(:black_pawn)
    end

    it "a black pawn is in the f7 position" do
      piece = @chessboard.send('get_piece_at', :f7)
      expect(piece.complete_name).to be(:black_pawn)
    end

    it "a black pawn is in the g7 position" do
      piece = @chessboard.send('get_piece_at', :g7)
      expect(piece.complete_name).to be(:black_pawn)
    end

    it "a black pawn is in the h7 position" do
      piece = @chessboard.send('get_piece_at', :h7)
      expect(piece.complete_name).to be(:black_pawn)
    end

    # White pieces

    it "a white rook is in the a1 position" do
      piece = @chessboard.send('get_piece_at', :a1)
      expect(piece.complete_name).to be(:white_rook)
    end

    it "a white knight is in the b1 position" do
      piece = @chessboard.send('get_piece_at', :b1)
      expect(piece.complete_name).to be(:white_knight)
    end

    it "a white bishop is in the c1 position" do
      piece = @chessboard.send('get_piece_at', :c1)
      expect(piece.complete_name).to be(:white_bishop)
    end

    it "the white queen is in the d1 position" do
      piece = @chessboard.send('get_piece_at', :d1)
      expect(piece.complete_name).to be(:white_queen)
    end

    it "the white king is in the e1 position" do
      piece = @chessboard.send('get_piece_at', :e1)
      expect(piece.complete_name).to be(:white_king)
    end

    it "a white bishop is in the f1 position" do
      piece = @chessboard.send('get_piece_at', :f1)
      expect(piece.complete_name).to be(:white_bishop)
    end

    it "a white knight is in the g1 position" do
      piece = @chessboard.send('get_piece_at', :g1)
      expect(piece.complete_name).to be(:white_knight)
    end

    it "a white rook is in the h1 position" do
      piece = @chessboard.send('get_piece_at', :h1)
      expect(piece.complete_name).to be(:white_rook)
    end

    it "a white pawn is in the a2 position" do
      piece = @chessboard.send('get_piece_at', :a2)
      expect(piece.complete_name).to be(:white_pawn)
    end

    it "a white pawn is in the b2 position" do
      piece = @chessboard.send('get_piece_at', :b2)
      expect(piece.complete_name).to be(:white_pawn)
    end

    it "a white pawn is in the c2 position" do
      piece = @chessboard.send('get_piece_at', :c2)
      expect(piece.complete_name).to be(:white_pawn)
    end

    it "a white pawn is in the d2 position" do
      piece = @chessboard.send('get_piece_at', :d2)
      expect(piece.complete_name).to be(:white_pawn)
    end

    it "a white pawn is in the e2 position" do
      piece = @chessboard.send('get_piece_at', :e2)
      expect(piece.complete_name).to be(:white_pawn)
    end

    it "a white pawn is in the f2 position" do
      piece = @chessboard.send('get_piece_at', :f2)
      expect(piece.complete_name).to be(:white_pawn)
    end

    it "a white pawn is in the g2 position" do
      piece = @chessboard.send('get_piece_at', :g2)
      expect(piece.complete_name).to be(:white_pawn)
    end

    it "a white pawn is in the h2 position" do
      piece = @chessboard.send('get_piece_at', :h2)
      expect(piece.complete_name).to be(:white_pawn)
    end

  end

end
