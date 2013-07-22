FactoryGirl.define do
  factory :move do
    game
    turn 1
    seat 1
    indices 'WORD'.chars.map { |l| l.ord - 'A'.ord }
  end
end
