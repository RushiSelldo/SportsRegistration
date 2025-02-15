class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :match

  validates :status, presence: true, inclusion: { in: %w[pending confirmed rejected] }
  validates :user_id, uniqueness: { scope: :match_id, message: "has already joined this match" }

  # Scopes
  scope :confirmed, -> { where(status: "confirmed") }

  # Callbacks
  before_validation :set_default_status, on: :create
  before_create :check_player_limit
  after_update :notify_user_status_change

  private

  def set_default_status
    self.status ||= "pending"
  end

  def check_player_limit
    if match.registrations.confirmed.count >= match.max_players
      errors.add(:base, "Match is already full")
      throw(:abort)
    end
  end

  def notify_user_status_change
    if saved_change_to_status?
      puts "Hello #{user.name}, your registration status for '#{match.title}' is now '#{status}'."
    end
  end
end
