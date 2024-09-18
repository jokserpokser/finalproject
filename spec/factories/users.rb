FactoryBot.define do
  factory :user do
    email { "test@example.com" }
    password { "password" }
    password_confirmation { "password" }
    user_type { "regular" } # Adjust this as necessary for your application
  end
end
