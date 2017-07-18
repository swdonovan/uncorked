FactoryGirl.define do
  factory :follow do
    user
    target { |a| a.association(:venue) }
  end
end
