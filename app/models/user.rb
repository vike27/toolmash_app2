class User < ActiveRecord::Base
  has_many :tools
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
