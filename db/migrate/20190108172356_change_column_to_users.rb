class ChangeColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :coloc_id, from: nil, to: 108
    change_column_default :users, :photo, from: nil, to: "user-default.jpg"
    change_column_default :users, :pseudo, from: nil, to: "mon petit chat"
    change_column_null :users, :pseudo, null: false
  end
end
