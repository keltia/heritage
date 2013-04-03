# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :available_size do
    user_id 1
    size "MyString"
    price "MyString"
    shipping_price "MyString"
  end
end
