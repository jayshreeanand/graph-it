FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email-#{n}@demo.com" }
    password { 'demo123' }
    confirmed_at { Time.now - 1.hour }
    first_name { 'Demo' }
    last_name { 'User' }
  end
end