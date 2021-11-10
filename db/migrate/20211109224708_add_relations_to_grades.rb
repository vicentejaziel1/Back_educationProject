class AddRelationsToGrades < ActiveRecord::Migration[5.2]
  def change
    add_column :grades, :subject_id, :numeric
    add_column :grades, :student_id, :numeric
  end
end
