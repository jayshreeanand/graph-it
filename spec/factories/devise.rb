FactoryBot.define do
  factory :user do
    id { 1 }
    email { 'demo@demo.com' }
    password { 'demo123' }
    confirmed_at { Time.now - 1.hour }
    first_name { 'Demo' }
    last_name { 'User' }
  end

  # Not used in this tutorial, but left to show an example of different user types
  # factory :admin do
  #   id {2}
  #   email {"test@admin.com"}
  #   password {"qwerty"}
  #   admin {true}
  # end
end