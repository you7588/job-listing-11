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

  mount_uploader :logo, JobLogoUploader

  belongs_to :user


  STATUS = ["full_time", "part_time", "internship"]
  validates_inclusion_of :status, :in => STATUS

  SCALE = ["0~20人", "20~99人", "100~499人", "500~999人", "1000~9999人", "10000人以上"]

  JOB_EXPERIENCE = ["经验不限", "应届生", "1年以内", "1~3年", "3~5年", "5~10年", "10年以上"]

  FINANCING_STAGE = ["未融资", "天使轮", "A轮", "B轮", "C轮", "D轮以上", "已上市", "不需要融资"]

  EDUCATION_BACKGROUND = ["中专以下", "高中", "大专", "本科", "硕士", "博士"]

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
  scope :freedom, -> { rank(:row_order)}

  def to_param
    "#{self.id}-#{self.title}"
  end

  belongs_to :education, :optional => true
  belongs_to :city, :optional => true

  include RankedModel
  ranks :row_order

end
