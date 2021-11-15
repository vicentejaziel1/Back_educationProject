class AddSubjectIdToAssignment < ActiveRecord::Migration[5.2]
  def change
    add_reference :assignments, :subject, foreign_key: true
  end
end
