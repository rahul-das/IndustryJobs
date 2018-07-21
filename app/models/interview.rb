class Interview < ApplicationRecord
  belongs_to :job_application
  default_scope { order(updated_at: :desc) }

  validates :job_application_id, presence: true, uniqueness: true
end
