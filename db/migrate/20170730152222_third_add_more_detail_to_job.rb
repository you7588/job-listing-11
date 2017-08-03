class ThirdAddMoreDetailToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :job_experience, :string
    add_column :jobs, :education_background, :string
    add_column :jobs, :skill, :string
    add_column :jobs, :company, :string
    add_column :jobs, :financing_stage, :string
    add_column :jobs, :industry, :string
    add_column :jobs, :job_category, :string
  end
end
