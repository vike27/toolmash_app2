class AddColumnsToTools < ActiveRecord::Migration
  def change
    add_column :tools, :name, :string
    add_column :tools, :description, :text
  end
end
