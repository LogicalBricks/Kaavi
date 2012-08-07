# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :traduccion do
    significado { FactoryGirl.create(:significado)} 
  end
end
