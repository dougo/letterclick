# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game_state do
    game nil
    whose_turn ""
  end
end
