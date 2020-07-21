class Board
  attr_accessor :board, :booked_slots

  def initialize
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    @booked_slots = []
  end

  def mark_on_board(move, player_mark)
    (0..@board.length - 1).each do |i|
      (0..@board.length - 1).each do |j|
        @board[i][j] = player_mark if @board[i][j] == move
      end
    end
  end
  
  def win_check(mark)
    return true if check_in_row(mark) || check_in_column(mark) || check_in_diagonal(mark) || check_in_cross(mark)

    false
  end

  private

  def check_in_row(mark)
    @board.each do |row|
      return true if row.all?(mark)
    end
    false
  end

  def check_in_column(mark)
    (0..2).each do |i|
      col = []
      (0..2).each do |j|
        col << @board[j][i]
      end
      return true if col.all?(mark)
    end
    false
  end

  def check_in_diagonal(mark)
    diagonal = []
    (0..2).each do |i|
      diagonal << @board[i][i]
    end
    return true if diagonal.all?(mark)

    false
  end

  def check_in_cross(mark)
    i = 2
    cross = []
    (0..2).each do |j|
      cross << @board[j][i]
      i -= 1
    end
    return true if cross.all?(mark)

    false
  end
end
