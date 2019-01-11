class RemoveScoreToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :score, :integer
  end
end
