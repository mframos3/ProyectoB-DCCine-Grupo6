class AddValidationToMovie < ActiveRecord::Migration[6.1]
  def change
    change_column :movies, :title, :string, null: false
  end
end
