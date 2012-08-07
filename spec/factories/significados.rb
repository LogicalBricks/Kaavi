# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :significado do
    sequence(:palabra){ |n| "significado#{n}"}
  end
end
