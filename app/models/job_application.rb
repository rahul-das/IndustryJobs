class JobApplication < ApplicationRecord
  belongs_to :candidate
  belongs_to :job
  has_one :interview

  has_secure_token :response_token

  enum status: [ :invitation_not_sent, :invitation_sent ]
  enum response_status: [ :accepted, :rejected ]
  enum rejection_reason: [:i_can_not_get_there, :i_am_not_feeling_well, :i_have_an_emergency, :i_have_got_another_job_offer]

  validates_uniqueness_of :job_id , :scope => :candidate_id
end
