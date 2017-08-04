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
  validates :title, :wage_upper_bound, :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}
  # validates :skill, :company, :financing_stage, :industry, :source, :place, :scale, :job_experience, :education_background, presence: true


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

  def to_param
    "#{self.id}-#{self.title}"
  end

  belongs_to :education, :optional => true

end
