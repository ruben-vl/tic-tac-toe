# frozen_string_literal: true

# Represents the Tic Tac Toe board state
class Board
  def initialize
    @board_state = empty_board
  end

  private

  def empty_board
    Array.new(9)
  end

  def clear
    @board_state = empty_board
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

  def draw?
    full? && !x_wins? && !o_wins?
  end

  def full?
    @board_state.none?(&:nil?)
  end

  def x_wins?
    winner == 'x'
  end

  def o_wins?
    winner == 'o'
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
