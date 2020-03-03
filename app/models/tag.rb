class Tag < ApplicationRecord
  belongs_to :user, optional: true
  has_many :finders
  validates :code, presence: true, uniqueness: true
end
