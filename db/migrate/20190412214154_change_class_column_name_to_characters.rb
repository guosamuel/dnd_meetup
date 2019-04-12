class ChangeClassColumnNameToCharacters < ActiveRecord::Migration[5.2]
  def change
    remove_column :characters, :class, :string
  end
end
