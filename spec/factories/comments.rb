FactoryGirl.define do
  factory :comment do
    content "My Comment Text"
    event
    user
  end
end
