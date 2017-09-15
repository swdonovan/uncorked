FactoryGirl.define do
  factory :wine do
    varietal "MyString"
    vintage "MyString"
    vineyard "MyString"
    rating 98
    description "TASTY"
    sequence(:name) { |n| "name #{n}"}
  end

  trait :with_review do
    after(:create) do |wine|
      create(:review, reviewable: wine)
    end
  end
end
