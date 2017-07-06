class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates_presence_of :email, :password, :fname, :lname, :age
end
