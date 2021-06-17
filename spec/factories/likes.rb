FactoryBot.define do
  factory :like do
    user { spot.user }
    association :spot
  end
end