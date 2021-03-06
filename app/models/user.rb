class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  # Direct associations
  has_many :access_grants,
           class_name: "Doorkeeper::AccessGrant",
           foreign_key: :resource_owner_id,
           dependent: :delete_all # or :destroy if you need callbacks

  has_many :access_tokens,
           class_name: "Doorkeeper::AccessToken",
           foreign_key: :resource_owner_id,
           dependent: :delete_all # or :destroy if you need callbacks

  has_many   :pending_friend_requests,
             class_name: "FriendRequest",
             foreign_key: "sender_id",
             dependent: :destroy

  has_many   :latest_photos,
             class_name: "Photo",
             foreign_key: "owner_id",
             dependent: :destroy

  has_many   :accepted_sent_friend_requests,
             -> { accepted },
             class_name: "FriendRequest",
             foreign_key: "sender_id",
             dependent: :destroy

  has_many   :received_friend_requests,
             class_name: "FriendRequest",
             foreign_key: "recipient_id",
             dependent: :destroy

  has_many   :sent_friend_requests,
             class_name: "FriendRequest",
             foreign_key: "sender_id",
             dependent: :destroy

  has_many   :comments,
             foreign_key: "commenter_id",
             dependent: :destroy

  has_many   :likes,
             class_name: "Vote",
             dependent: :destroy

  has_many   :photos,
             foreign_key: "owner_id",
             dependent: :destroy

  # Indirect associations

  has_many   :followers,
             through: :received_friend_requests,
             source: :follower

  has_many   :recipients,
             through: :accepted_sent_friend_requests,
             source: :recipient

  has_many   :liked_photos,
             through: :likes,
             source: :photo

  has_many   :commented_photos,
             through: :comments,
             source: :photo

  # Validations

  validates :age, numericality: { equal_to: 20, less_than: 22, other_than: 19, greater_than: 18, less_than_or_equal_to: 21, greater_than_or_equal_to: 20, odd: true }

  validates :username, uniqueness: { scope: %i[first_name last_name age], allow_blank: true, case_sensitive: true, message: "username should be unique always" }

  validates :username, presence: { message: "username can not be blank!" }

  validates :username, length: { minimum: 5, maximum: 20, allow_blank: true }

  validates :username, inclusion: { in: ["Ram", "Lakshmana"] }

  # Scopes

  scope :vulnerable, -> { where("users.age >= :query", query: 60) }

  def to_s
    first_name
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
