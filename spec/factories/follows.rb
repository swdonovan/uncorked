FactoryGirl.define do
  factory :follow do
    user
    trait :a_venue do
      target { |a| a.association(:venue) }
    end
    trait :a_user do
      target { |a| a.association(:user) }
    end
  end
end
