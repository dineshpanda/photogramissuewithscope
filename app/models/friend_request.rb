class FriendRequest < ApplicationRecord
  # Direct associations

  belongs_to :pending_sender,
             class_name: "User",
             foreign_key: "sender_id"

  belongs_to :follower,
             class_name: "User",
             foreign_key: "sender_id",
             counter_cache: :accepted_sent_friend_requests_count

  belongs_to :recipient,
             class_name: "User",
             counter_cache: :received_friend_requests_count

  belongs_to :sender,
             class_name: "User",
             counter_cache: :sent_friend_requests_count

  # Indirect associations

  # Validations

  validates :recipient_id, uniqueness: { scope: [:sender_id], message: "already requested" }

  validates :recipient_id, presence: true

  validates :sender_id, presence: true

  validates :status, presence: true

  validates :status, inclusion: { in: ["pending", "accepted", "declined"] }

  # Scopes

  scope :pending, -> { where(status: "pending") }

  scope :accepted, -> { where(status: "accepted") }

  def to_s
    sender.to_s
  end
end
