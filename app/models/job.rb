# == Schema Information
#
# Table name: jobs
#
#  id               :integer          not null, primary key
#  title            :string
#  description      :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  wage_upper_bound :integer
#  wage_lower_bound :integer
#  contact_email    :string
#  is_hidden        :boolean          default(TRUE)
#  source           :string
#  place            :string
#  scale            :string
#

class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}
  validates :source, presence: true
  validates :place, presence: true
  validates :scale, presence: true
  validates :job_experience, presence: true
  validates :education_background, presence: true
  validates :skill, presence: true
  validates :company, presence: true
  validates :financing_stage, presence: true
  validates :industry, presence: true
  validates :job_category, presence: true

  STATUS = ["full_time", "part_time", "internship"]
  validates_inclusion_of :status, :in => STATUS
  
  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
  scope :published, -> { where(is_hidden: false) }
  scope :recent, -> { order('created_at DESC')}

end
