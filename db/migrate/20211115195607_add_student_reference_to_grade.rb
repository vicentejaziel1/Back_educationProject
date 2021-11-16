class AddStudentReferenceToGrade < ActiveRecord::Migration[5.2]
  def change
    add_reference :grades, :user, foreign_key: true
  end
end
