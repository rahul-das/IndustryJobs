class ChangeRejectionReasonToBeIntegerInJobApplications < ActiveRecord::Migration[5.2]
  def change
      change_column :job_applications, :rejection_reason, :integer, using: 'rejection_reason::integer'
  end
end
