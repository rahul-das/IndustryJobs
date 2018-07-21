class Interview < ApplicationRecord
  belongs_to :job_application

  validates :job_application_id, presence: true, uniqueness: true
end
