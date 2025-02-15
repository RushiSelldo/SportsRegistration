class User < ApplicationRecord
  has_secure_password
  has_many :hosted_matches, class_name: "Match", foreign_key: "host_id", dependent: :destroy
  has_many :registrations, dependent: :destroy
  has_many :joined_matches, through: :registrations, source: :match

  validates :email, presence: true, uniqueness: true
end
