FactoryBot.define do
  factory :user do
    id { 1 }
    sequence(:name) { |n| "test_user_#{n}" }
    sequence(:email) { |n| "test_user_#{n}@example.com" }
    license { "a" * 500 }
    password { 'password' }
    password_confirmation { 'password' }
  end 
end