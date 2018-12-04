class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :icon
      t.text :description
      t.integer :weight
      t.integer :points
      t.references :coloc, foreign_key: true

      t.timestamps
    end
  end
end
