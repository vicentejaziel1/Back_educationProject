class CreateAdvices < ActiveRecord::Migration[5.2]
  def change
    create_table :advices do |t|
      t.string :title
      t.text :content
      t.references :created_by

      t.timestamps
    end
  end
end
