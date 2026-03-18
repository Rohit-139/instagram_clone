class AddColumnToProfile < ActiveRecord::Migration[8.1]
  def change
    add_column :profiles, :about, :string
  end
end
