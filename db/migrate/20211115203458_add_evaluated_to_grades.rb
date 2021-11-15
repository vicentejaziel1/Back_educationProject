class AddEvaluatedToGrades < ActiveRecord::Migration[5.2]
  def change
    add_column :grades, :evaluated, :boolean, default: false
  end
end
