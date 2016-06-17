class User < ActiveRecord::Base
  has_secure_password
  # Remember to create a migration!
  has_many :posts

  # TODO: validations


  # TODO: relationship with like


  # TODO: Create methods to follow/unfollow user
end
