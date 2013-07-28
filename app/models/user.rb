require 'bcrypt'

class User < ActiveRecord::Base

  include BCrypt

  # def password
  #   @password ||= Password.new(password_hash)
  # end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end

  # def self.create(params)
  #   @user = User.new(name: params[:name])
  #   @user.password = params[:password]
  #   @user.save! if User.password_confirmation(params)
  #   @user
  # end


  def self.authenticate(email, password)
    user = User.find_by_email(email)
    (BCrypt::Password.new(user.password_hash) rescue nil) == password ? user : nil
  end


end
