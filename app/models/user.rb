class User < ApplicationRecord
  has_many :wishes, class_name: 'Wishlist'
  has_many :goals

  def current_goal
    # Assuming a user can have only one current goal at a time
    goals.where(achieved: false).first
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
