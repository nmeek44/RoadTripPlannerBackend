class ChangePasswordTypeBackThenRename < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :password, :string

    change_table :users do |t|
      t.rename :password, :password_digest
    end
  end
end
