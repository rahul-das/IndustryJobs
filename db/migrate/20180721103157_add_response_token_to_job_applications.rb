class AddResponseTokenToJobApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :job_applications, :response_token, :string
    add_index :job_applications, :response_token, unique: true
  end
end
