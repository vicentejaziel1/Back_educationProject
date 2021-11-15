class FixGradesAssignmentRelation < ActiveRecord::Migration[5.2]
  def up
    change_table :grades do |t|
      t.references :assignment, index: true
    end
  end

  def down
    change_table :grades do |t|
      t.remove_references :subject, index: true
    end
  end
end
