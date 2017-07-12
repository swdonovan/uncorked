FactoryGirl.define do
  factory :user do
    first_name "MyFirstName"
    last_name "MyLastName"
    username "MyUserName"
    email "MyEmail@email.com"
    bio "Mybio blah blah"
    phone_number "12310041041"
    password "password"
    role 0
  end
end
