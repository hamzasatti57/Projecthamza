class AddUserRefToScripts < ActiveRecord::Migration[5.1]
  def change
    add_reference :scripts, :user, foreign_key: true
  end
end