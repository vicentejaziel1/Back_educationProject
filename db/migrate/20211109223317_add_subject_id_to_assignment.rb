class AddSubjectIdToAssignment < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :subject_id, :numeric
  end
end
