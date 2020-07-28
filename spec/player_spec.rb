require_relative '../lib/player'

describe Player do
  let(:player_name) { 'tic' }
  let(:player_mark) { 'X' }
  let(:player) { Player.new(player_name, player_mark) }

  it 'When a player name is passed' do
    expect(player.name).to eql(player_name)
  end

  it 'When a player mark is passed' do
    expect(player.mark).to eql(player_mark)
  end
end
