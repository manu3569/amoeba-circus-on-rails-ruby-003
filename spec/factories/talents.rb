# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :talent do
    name "MyString"
    factory :juggler do
      name "juggler"
    end
  end
end
