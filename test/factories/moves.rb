FactoryGirl.define do
  factory :move do
    game
    turn 1
    indices [9, 0, 1, 2, 5]
  end
end
