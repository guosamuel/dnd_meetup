class AddKlassToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :klass, :string
  end
end
