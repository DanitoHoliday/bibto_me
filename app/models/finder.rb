class Finder < ApplicationRecord
  belongs_to :tag
  validates :phone, format: { with: /\d{01}/, message: "bad format" }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_length_of :message, :minimum => 10, :maximum => 120, :allow_blank => true
end
