class AddOwnerToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :owner, polymorphic: true
  end
end
