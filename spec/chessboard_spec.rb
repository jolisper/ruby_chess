require 'spec_helper'
require 'ruby_chess'

include RubyChess

describe ChessBoard do
  
  it "has 64 squares" do
    chessboard = ChessBoard.new
    expect(chessboard.squares.size).to be 64
  end

  it "top left square is the 8a square" do
    chessboard = ChessBoard.new
    square = chessboard.squares.first
    expect(square.position?(8, 'a')).to be true
  end

  it "botton right square is the 1h square" do
    chessboard = ChessBoard.new
    square = chessboard.squares.last
    expect(square.position?(1, 'h')).to be true
  end

end

