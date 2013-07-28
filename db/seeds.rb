require 'faker'

# create a few users

#TODO: Once you have implemented BCrypt - you can use these to seed your database.


User.create :name => 'Dev Bootcamp Student', :email => 'me@example.com', :password_hash => 'password'
5.times do
  @password = BCrypt::Password.create 'password'
  User.create :name => Faker::Name.name, :email => Faker::Internet.email, :password_hash => @password
end