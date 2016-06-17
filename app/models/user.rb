require 'bcrypt'

class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :username, :presence => true, :uniqueness => true, :on => :create
  validates :email, :presence => true, :uniqueness => true, :on => :create
  # TODO: relationship with like


  # TODO: Create methods to follow/unfollow user
  has_many :posts


  #Bcrypt stuff
  def password
    @password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.encrypted_password = @password
  end


  def authenticate(password)
  	self.password == password
  end

end
