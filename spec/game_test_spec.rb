
require_relative '../lib/board.rb'

describe Board do
  let(:board) {Board.new}
  let(:player_mark) {'X'}

  describe '#win_check' do
    it "when it's a row" do

      board.mark_on_board(1, player_mark)
      board.mark_on_board(2, player_mark)
      board.mark_on_board(3, player_mark)

      expect(board.win_check(player_mark)).to eql(true)
    end

    it "when it's a column" do
      
      board.mark_on_board(1, player_mark)
      board.mark_on_board(4, player_mark)
      board.mark_on_board(7, player_mark)

      expect(board.win_check(player_mark)).to eql(true)
    end

    it "when it's a diagonal" do
      
      board.mark_on_board(1, player_mark)
      board.mark_on_board(5, player_mark)
      board.mark_on_board(9, player_mark)

      expect(board.win_check(player_mark)).to eql(true)
    end

    it "when it's a cross" do
      
      board.mark_on_board(3, player_mark)
      board.mark_on_board(5, player_mark)
      board.mark_on_board(7, player_mark)

      expect(board.win_check(player_mark)).to eql(true)
    end

    it "when it's a draw" do

      board.mark_on_board(1, player_mark)
      board.mark_on_board(2, 'O')
      board.mark_on_board(3, player_mark)
      board.mark_on_board(4, 'O')
      board.mark_on_board(5, player_mark)
      board.mark_on_board(6, player_mark)
      board.mark_on_board(7, 'O')
      board.mark_on_board(8, player_mark)
      board.mark_on_board(9, 'O')

      expect(board.win_check(player_mark)).to eql(false)
    end


    it "when it's a draw" do

      board.mark_on_board(1, player_mark)
      board.mark_on_board(2, 'O')
      board.mark_on_board(3, player_mark)
      board.mark_on_board(4, 'O')
      board.mark_on_board(5, player_mark)
      board.mark_on_board(6, player_mark)
      board.mark_on_board(7, 'O')
      board.mark_on_board(8, player_mark)
      board.mark_on_board(9, 'O')

      expect(board.win_check('O')).to eql(false)
    end
  end

end
