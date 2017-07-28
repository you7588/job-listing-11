# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  user_id    :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  attachment :string
#

class Resume < ApplicationRecord
  validates :one_word, presence: true
  validates :content, presence: true
  validates :experience, presence: true
  validates :why, presence: true
  validates :prove, presence: true
  validates :action, presence: true

  belongs_to :user

  mount_uploader :attachment, AttachmentUploader
end
