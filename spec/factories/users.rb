FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "Test".concat n.to_s}
    sequence(:email) {|n| "test#{n}@email.com"}
    password "password"
  end
end
