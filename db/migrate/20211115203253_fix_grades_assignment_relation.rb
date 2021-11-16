class FixGradesAssignmentRelation < ActiveRecord::Migration[5.2]
  def change
    add_reference :grades, :subject, foreign_key: true
  end
end
