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

  it "top left square is the 8a square" do
    square = @chessboard.instance_variable_get(:@squares).first
    expect(square.position).to be(:'8a')
  end

  it "botton right square is the 1h square" do
    square = @chessboard.instance_variable_get(:@squares).last
    expect(square.position).to be(:'1h')
  end

  context "when new game is started" do
    before(:each) { 
      @chessboard = ChessBoard.new
      @chessboard.new_game
    }

    it "#new_game returns true" do
      expect(@chessboard.new_game).to be(true)
    end

    it "a black rook is in the 8a position" do
      piece = @chessboard.send('get_piece_at', 8, :a)
      expect(piece.complete_name).to be(:black_rook)
    end

    it "a black knight is in the 8b position" do
      piece = @chessboard.send('get_piece_at', 8, :b)
      expect(piece.complete_name).to be(:black_knight)
    end

    it "a black bishop is in the 8c position" do
      piece = @chessboard.send('get_piece_at', 8, :c)
      expect(piece.complete_name).to be(:black_bishop)
    end

    it "the black queen is in the 8d position" do
      piece = @chessboard.send('get_piece_at', 8, :d)
      expect(piece.complete_name).to be(:black_queen)
    end

    it "the black king is in the 8e position" do
      piece = @chessboard.send('get_piece_at', 8, :e)
      expect(piece.complete_name).to be(:black_king)
    end

    it "a black bishop is in the 8f position" do
      piece = @chessboard.send('get_piece_at', 8, :f)
      expect(piece.complete_name).to be(:black_bishop)
    end

    it "a black knight is in the 8g position" do
      piece = @chessboard.send('get_piece_at', 8, :g)
      expect(piece.complete_name).to be(:black_knight)
    end

    it "a black rook is in the 8h position" do
      piece = @chessboard.send('get_piece_at', 8, :h)
      expect(piece.complete_name).to be(:black_rook)
    end

    it "a black pawn is in the 7a position" do
      piece = @chessboard.send('get_piece_at', 7, :a)
      expect(piece.complete_name).to be(:black_pawn)
    end

    it "a black pawn is in the 7b position" do
      piece = @chessboard.send('get_piece_at', 7, :b)
      expect(piece.complete_name).to be(:black_pawn)
    end

    it "a black pawn is in the 7c position" do
      piece = @chessboard.send('get_piece_at', 7, :c)
      expect(piece.complete_name).to be(:black_pawn)
    end

    it "a black pawn is in the 7d position" do
      piece = @chessboard.send('get_piece_at', 7, :d)
      expect(piece.complete_name).to be(:black_pawn)
    end

    it "a black pawn is in the 7e position" do
      piece = @chessboard.send('get_piece_at', 7, :e)
      expect(piece.complete_name).to be(:black_pawn)
    end

    it "a black pawn is in the 7f position" do
      piece = @chessboard.send('get_piece_at', 7, :f)
      expect(piece.complete_name).to be(:black_pawn)
    end

    it "a black pawn is in the 7g position" do
      piece = @chessboard.send('get_piece_at', 7, :g)
      expect(piece.complete_name).to be(:black_pawn)
    end

    it "a black pawn is in the 7h position" do
      piece = @chessboard.send('get_piece_at', 7, :h)
      expect(piece.complete_name).to be(:black_pawn)
    end

    # White pieces

    it "a white rook is in the 1a position" do
      piece = @chessboard.send('get_piece_at', 1, :a)
      expect(piece.complete_name).to be(:white_rook)
    end

    it "a white knight is in the 1b position" do
      piece = @chessboard.send('get_piece_at', 1, :b)
      expect(piece.complete_name).to be(:white_knight)
    end

    it "a white bishop is in the 8c position" do
      piece = @chessboard.send('get_piece_at', 1, :c)
      expect(piece.complete_name).to be(:white_bishop)
    end

    it "the white queen is in the 8d position" do
      piece = @chessboard.send('get_piece_at', 1, :d)
      expect(piece.complete_name).to be(:white_queen)
    end

    it "the white king is in the 8e position" do
      piece = @chessboard.send('get_piece_at', 1, :e)
      expect(piece.complete_name).to be(:white_king)
    end

    it "a white bishop is in the 8f position" do
      piece = @chessboard.send('get_piece_at', 1, :f)
      expect(piece.complete_name).to be(:white_bishop)
    end

    it "a white knight is in the 8g position" do
      piece = @chessboard.send('get_piece_at', 1, :g)
      expect(piece.complete_name).to be(:white_knight)
    end

    it "a white rook is in the 8h position" do
      piece = @chessboard.send('get_piece_at', 1, :h)
      expect(piece.complete_name).to be(:white_rook)
    end

    it "a white pawn is in the 7a position" do
      piece = @chessboard.send('get_piece_at', 2, :a)
      expect(piece.complete_name).to be(:white_pawn)
    end

    it "a white pawn is in the 7b position" do
      piece = @chessboard.send('get_piece_at', 2, :b)
      expect(piece.complete_name).to be(:white_pawn)
    end

    it "a white pawn is in the 7c position" do
      piece = @chessboard.send('get_piece_at', 2, :c)
      expect(piece.complete_name).to be(:white_pawn)
    end

    it "a white pawn is in the 7d position" do
      piece = @chessboard.send('get_piece_at', 2, :d)
      expect(piece.complete_name).to be(:white_pawn)
    end

    it "a white pawn is in the 7e position" do
      piece = @chessboard.send('get_piece_at', 2, :e)
      expect(piece.complete_name).to be(:white_pawn)
    end

    it "a white pawn is in the 7f position" do
      piece = @chessboard.send('get_piece_at', 2, :f)
      expect(piece.complete_name).to be(:white_pawn)
    end

    it "a white pawn is in the 7g position" do
      piece = @chessboard.send('get_piece_at', 2, :g)
      expect(piece.complete_name).to be(:white_pawn)
    end

    it "a white pawn is in the 7h position" do
      piece = @chessboard.send('get_piece_at', 2, :h)
      expect(piece.complete_name).to be(:white_pawn)
    end

  end

end
