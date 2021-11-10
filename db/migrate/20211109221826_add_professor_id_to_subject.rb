class AddProfessorIdToSubject < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :professor_id, :numeric
  end
end
