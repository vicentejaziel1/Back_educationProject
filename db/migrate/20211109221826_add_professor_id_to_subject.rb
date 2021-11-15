class AddProfessorIdToSubject < ActiveRecord::Migration[5.2]
  def change
    add_reference :subjects, :professor, foreign_key: true
  end
end
