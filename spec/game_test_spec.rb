
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

    it "when it's a column"
  end

end
