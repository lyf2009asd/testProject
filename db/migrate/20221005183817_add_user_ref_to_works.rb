class AddUserRefToWorks < ActiveRecord::Migration[7.0]
  def change
    add_reference :works, :user, null: true, foreign_key: true
  end
end
