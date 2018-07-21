class Job < ApplicationRecord
  belongs_to :user
  default_scope { order(updated_at: :desc) }

  has_many :job_applications
  has_many :candidates, through: :job_applications
end
