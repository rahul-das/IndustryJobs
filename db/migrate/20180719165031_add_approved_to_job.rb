class AddApprovedToJob < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :approved, :boolean
  end
end
