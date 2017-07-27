class AddTheDetailToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :source, :string
    add_column :jobs, :place, :string
    add_column :jobs, :scale, :string
  end
end
