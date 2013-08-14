require 'faker'

10.times do
  @password = BCrypt::Password.create 'password'
  User.create :name => Faker::Name.name, :email => Faker::Internet.email, :password_hash => @password
end