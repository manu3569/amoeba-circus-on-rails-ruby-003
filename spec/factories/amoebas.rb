# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :amoeba do
    name "MyString"
    generation 1
    talent nil
    factory :joe do
      name "Joe"
      association :talent, :juggler
    end
  end
end
