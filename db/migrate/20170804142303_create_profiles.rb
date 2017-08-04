class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id, :index => true
      t.string :legal_name
      t.string :username
      t.date :birthday
      t.string :location
      t.string :motto
      t.string :wechat
      t.timestamps
    end
  end
end
