class CreateProfessors < ActiveRecord::Migration[5.2]
  def change
    create_table :professors do |t|
      t.string :name
      t.string :lastname
      t.string :matriname
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
