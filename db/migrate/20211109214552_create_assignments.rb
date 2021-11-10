class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.string :title
      t.string :description
      t.datetime :limit_date
      t.numeric :percentage

      t.timestamps
    end
  end
end
