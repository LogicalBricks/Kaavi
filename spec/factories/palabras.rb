# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :palabra_con_traduccion, parent: :palabra do
    traducciones {[FactoryGirl.create(:traduccion)]}
  end

  factory :palabra_con_traducciones, parent: :palabra do
    traducciones {[FactoryGirl.create(:traduccion), FactoryGirl.create(:traduccion)]}
  end

  factory :palabra do
    palabra "ka'avi"
    lugar "Mixteca Alta"
  end
end
