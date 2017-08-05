class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.integer :job_id, :index => true
      t.string :name 
      t.timestamps
    end
  end
end
