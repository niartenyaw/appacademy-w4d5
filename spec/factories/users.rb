FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password_digest BCrypt::Password.create('password')
    session_token { Faker::Name.name }

    factory :logged_user do
      email 'email1'
    end
  end
end
