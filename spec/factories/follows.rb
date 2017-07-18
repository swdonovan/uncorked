FactoryGirl.define do
  factory :follow do
    user
    trait :a_venue do
      target { |a| a.association(:venue) }
    end
  end
end
