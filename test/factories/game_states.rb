# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game_state do
    game
    turn 2
    squares [GameState::UNCLAIMED]*Game::SIZE**2
  end
end
