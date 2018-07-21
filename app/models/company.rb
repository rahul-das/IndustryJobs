class Company < ApplicationRecord
  has_many :users
  validates :name, presence: true, uniqueness: true
  default_scope { order(updated_at: :desc) }
end
