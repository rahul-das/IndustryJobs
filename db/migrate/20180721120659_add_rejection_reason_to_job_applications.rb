class AddRejectionReasonToJobApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :job_applications, :rejection_reason, :string
  end
end
