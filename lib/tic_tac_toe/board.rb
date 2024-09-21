# frozen_string_literal: true

# Represents the Tic Tac Toe board state
class Board
  def initialize
    @board_state = empty_board
  end

  def print_board # rubocop:disable Metrics/AbcSize
    puts "\n    0   1   2"
    horizontal_divider = '  +---+---+---+'
    (0..2).each do |row|
      puts horizontal_divider
      cell1 = @board_state[(row * 3) + 0].nil? ? ' ' : @board_state[(row * 3)]
      cell2 = @board_state[(row * 3) + 1].nil? ? ' ' : @board_state[(row * 3) + 1]
      cell3 = @board_state[(row * 3) + 2].nil? ? ' ' : @board_state[(row * 3) + 2]
      puts "#{row} | #{cell1} | #{cell2} | #{cell3} |"
    end
    puts "#{horizontal_divider}\n\n"
  end

  def add(element, row, column)
    index = (row * 3) + column
    if @board_state[index].nil?
      @board_state[index] = element
      true
    else
      puts "Index #{index} is not empty"
      false
    end
  end

  def game_end?
    !winner.nil? || full?
  end

  private

  def empty_board
    Array.new(9)
  end

  def full?
    @board_state.none?(&:nil?)
  end

  def winner
    return winning_row if winning_row

    return winning_column if winning_column

    return winning_diagonal if winning_diagonal

    nil
  end

  def winning_row
    (0..2).each do |row|
      row_elements = (0..2).map do |col|
        @board_state[(row * 3) + col]
      end
      return row_elements[0] if row_elements.none?(&:nil?) && row_elements.uniq.size == 1
    end
    nil
  end

  def winning_column
    (0..2).each do |col|
      col_elements = (0..2).map do |row|
        @board_state[col + (row * 3)]
      end
      return col_elements[0] if col_elements.none?(&:nil?) && col_elements.uniq.size == 1
    end
    nil
  end

  def winning_diagonal
    diagonal1_idxs = [0, 4, 8]
    return diagonal1_idxs[0] if diagonal1_idxs.none?(&:nil?) && diagonal1_idxs.uniq.size == 1

    diagonal2_idxs = [2, 4, 6]
    return diagonal2_idxs[0] if diagonal2_idxs.none?(&:nil?) && diagonal2_idxs.uniq.size == 1

    nil
  end
end
