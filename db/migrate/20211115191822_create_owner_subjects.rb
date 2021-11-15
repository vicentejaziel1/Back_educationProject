class CreateOwnerSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :owner_subjects do |t|
      t.references :owner
      t.references :subject

      t.timestamps
    end
  end
end
