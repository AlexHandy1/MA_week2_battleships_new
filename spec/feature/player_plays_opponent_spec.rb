require 'board'
require 'player'

feature 'player can create a board' do
  scenario 'and fire against an opponent' do
      player1 = Player.new{Board.new}
      player2 = Player.new{Board.new}
      ship = Destroyer.new "A3"
      player1.opponent = player2
      player2.opponent = player1
      player2.place_my_ship ship
      player1.fire_at_opponent "A3"
      expect(player2.check_my_grid_square "A3").to eq "HIT"
  end

  scenario 'and check shots I have fired match' do
    player1 = Player.new{Board.new}
    player2 = Player.new{Board.new}
    ship = Destroyer.new "A3"
    player1.opponent = player2
    player2.opponent = player1
    player2.place_my_ship ship
    player1.fire_at_opponent "A3"
    expect(player2.check_my_grid_square "A3").to eq "HIT"
    expect(player1.check_my_shots "A3").to eq "X"
  end
end

feature 'player can play an opponent' do
    scenario 'and know when has won' do
      player1 = Player.new{Board.new}
      player2 = Player.new{Board.new}
      ship = Ship.new "A3"
      player1.opponent = player2
      player2.opponent = player1
      player2.place_my_ship ship
      player1.fire_at_opponent "A3"
      expect(player1.you_win).to eq "You win"
    end
end

