require 'faker'

FactoryGirl.define do
  factory :event do
    sequence(:name) {|n| "Test Event#{n}"}
    description "A Temporary event to test with."
    location "Pershing Square"
    time_zone "Pacific Time (US & Canada)"
    start_time Faker::Time.between(DateTime.now + 1, DateTime.now + 2)
    end_time Faker::Time.between(DateTime.now + 2, DateTime.now + 3)
    association :organizer, factory: :user
    # association :tags, factory: :tags
  end
end
