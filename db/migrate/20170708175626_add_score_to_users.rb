class AddScoreToUsers < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :score, :integer
  end

  def down
    remove_column :users, :score, :integer
  end
end
