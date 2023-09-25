class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :wishlist, class_name: 'Wishlist'
end
