class AddMoreDetailToResume < ActiveRecord::Migration[5.0]
  def change
    add_column :resumes, :one_word, :text
    add_column :resumes, :experience, :text
    add_column :resumes, :why, :text
    add_column :resumes, :prove, :text
    add_column :resumes, :action, :text
  end
end
