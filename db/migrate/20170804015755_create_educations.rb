class CreateEducations < ActiveRecord::Migration[5.0]
  def change
    create_table :educations do |t|
      t.string :name

      t.timestamps
    end
    add_column :jobs, :education_id, :integer
    add_index :jobs, :education_id
  end
end
