FactoryGirl.define do
  factory :review do
    description "MyText"
    rating 1
    user
    reviewable ""
  end
end
