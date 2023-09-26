class PopulateUserIdsInWishlists < ActiveRecord::Migration[7.0]
  def up
    # Loop through each wishlist
    Wishlist.find_each do |wishlist|
      # Add logic here to associate each wishlist with a user
      # For example, if wishlists have a name attribute that matches a user's email, you can do something like this:
      
      # Find a user by email (assuming there's an email attribute in users)
      user = User.find_by(email: wishlist.name)
      
      # Associate the wishlist with the user if found
      wishlist.update(user_id: user.id) if user
    end
  end

  def down
    # If needed, you can implement a down migration to undo the changes made in the up migration.
    # This is typically not needed for data migrations like this.
  end
end

