class AddBlurbToTools < ActiveRecord::Migration
  def change
    add_column :tools, :blurb, :string
  end
end
