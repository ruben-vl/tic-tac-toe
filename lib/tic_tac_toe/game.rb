# frozen_string_literal: true

require_relative 'board'

# Represents a Tic Tac Toe game
class Game
  def initialize
    @board = Board.new
    @turn = 'x'
  end

  def start
  end
end
