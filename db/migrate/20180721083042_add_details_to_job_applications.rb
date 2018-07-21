class AddDetailsToJobApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :job_applications, :status, :integer, default: 0
    add_column :job_applications, :response_status, :integer
  end
end
