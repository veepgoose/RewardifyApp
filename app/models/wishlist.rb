class Wishlist < ApplicationRecord
    mount_uploader :picture, PictureUploader
  
    def self.ransackable_attributes(auth_object = nil)
      %w[name] # List of searchable attributes
    end
  
    def self.ransackable_associations(auth_object = nil)
      [] # List of allowed associations for searching
    end
  end
  