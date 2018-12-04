class AddPseudoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pseudo, :string
    add_column :users, :photo, :string
    add_reference :users, :coloc, foreign_key: true
  end
end
