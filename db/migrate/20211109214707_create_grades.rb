class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.numeric :note
      t.text :comments

      t.timestamps
    end
  end
end
