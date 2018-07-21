class JobApplication < ApplicationRecord
  belongs_to :candidate
  belongs_to :job

  validates_uniqueness_of :job_id , :scope => :candidate_id
end
