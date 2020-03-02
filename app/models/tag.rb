class Tag < ApplicationRecord
  belongs_to :user
  has_many :finders
  validates :code, presence: true, uniqueness: true
end
