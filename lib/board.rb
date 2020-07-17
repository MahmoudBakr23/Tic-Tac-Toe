class Board 
  attr_accessor :board

  def initialize
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def mark_on_board( move, player_mark)
    (0..@board.length - 1).each do |i|
      (0..@board.length - 1).each do |j|
        @board[i][j] = player_mark if @board[i][j] == move
      end
    end
  end
  
  def display_board
    (0..@board.length - 1).each do |i|
      (0..@board.length - 1).each do |j|
        print @board[i][j].to_s + ' '
      end
      puts
    end
    puts
  end

  def win_check(mark)
    check_in_row(mark)
    # check on every colums
    # check on main diagonal
    # check on cross diagonal
  end

  private
    def check_in_row(mark)
      @board.each do |row|
        return true if row.all?(mark)
      end
      false
    end
end
