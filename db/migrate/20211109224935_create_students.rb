class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :lastname
      t.string :matriname
      t.string :email
      t.string :phone_number
      t.string :enrollment_number

      t.timestamps
    end
  end
end
