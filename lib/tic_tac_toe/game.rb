# frozen_string_literal: true

require_relative 'board'

# Represents a Tic Tac Toe game
class Game
  def initialize
    @board = Board.new
    @player1_turn = true
  end

  def start # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    puts 'Starting state of the board:'
    @board.print_board

    until @board.game_end?
      player = @player1_turn ? 'x' : 'o'
      puts "It is player #{player}'s turn."
      row = input_row
      col = input_column
      placed = @board.add(player, row, col)
      if placed
        @player1_turn = !@player1_turn
      else
        puts "Tile (#{row}, #{col}) is not free. Try again."
      end
      @board.print_board
    end
    declare_winner
    puts 'Want to restart? (y/n)'
    restart = gets.chomp
    return unless restart == 'y'

    @board = Board.new
    @player1_turn = true
    start
  end

  def input_row
    player = @player1_turn ? 'x' : 'o'
    puts "What row would you like to place an #{player} in?"
    until %w[0 1 2].include?(row = gets.chomp)
      puts "Invalid row. What row would you like to place an #{player} in?"
    end
    row
  end

  def input_column
    player = @player1_turn ? 'x' : 'o'
    puts "What column would you like to place an #{player} in?"
    until %w[0 1 2].include?(col = gets.chomp)
      puts "Invalid column. What column would you like to place an #{player} in?"
    end
    col
  end

  def declare_winner
    winner = @board.winner
    if winner.nil?
      puts 'The game is a draw!'
    else
      puts "The winner is #{winner}!"
    end
    nil
  end
end
