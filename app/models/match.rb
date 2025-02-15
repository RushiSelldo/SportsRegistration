class Match < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :registrations, dependent: :destroy
  has_many :players, through: :registrations, source: :user

  validates :title, :sport_type, :date, :location, :max_players, presence: true

  before_save :capitalize_title
  after_update :notify_host_if_full

  private

  def capitalize_title
    self.title = title.split.map(&:capitalize).join(" ")
  end

  def notify_host_if_full
    if registrations.confirmed.count >= max_players
      puts "Match '#{title}' is fully booked! Notify host #{host.email}"
    end
  end
end
