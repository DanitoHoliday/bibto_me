class Tag < ApplicationRecord
  belongs_to :user, optional: true
  has_many :finders
  validates :code, presence: true, uniqueness: true

  after_create :set_registration, on: [ :create ]

  private


    def set_registration
      self.registered = false
    end

end
