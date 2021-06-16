FactoryBot.define do
  factory :spot do
    s_name { 'spot' }
    address { 'japan' }
    start { '2021/6/16' }
    last { '2021/12/16' }
    money { '100,000' }
  end
end