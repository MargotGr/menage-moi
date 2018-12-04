class CreateColocs < ActiveRecord::Migration[5.2]
  def change
    create_table :colocs do |t|
      t.string :name

      t.timestamps
    end
  end
end
