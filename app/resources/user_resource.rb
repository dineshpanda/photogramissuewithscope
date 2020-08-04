class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :username, :string
  attribute :avatar, :string
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :bio, :string
  attribute :age, :integer

  # Direct associations

  has_many   :pending_friend_requests,
             resource: FriendRequestResource,
             foreign_key: :sender_id

  has_many   :latest_photos,
             resource: PhotoResource,
             foreign_key: :owner_id

  has_many   :accepted_sent_friend_requests,
             resource: FriendRequestResource,
             foreign_key: :sender_id

  has_many   :received_friend_requests,
             resource: FriendRequestResource,
             foreign_key: :recipient_id

  has_many   :sent_friend_requests,
             resource: FriendRequestResource,
             foreign_key: :sender_id

  has_many   :comments,
             foreign_key: :commenter_id

  has_many   :likes,
             resource: VoteResource

  has_many   :photos,
             foreign_key: :owner_id

  # Indirect associations

  has_many :followers, resource: UserResource do
    assign_each do |user, users|
      users.select do |u|
        u.id.in?(user.followers.map(&:id))
      end
    end
  end

  has_many :recipients, resource: UserResource do
    assign_each do |user, users|
      users.select do |u|
        u.id.in?(user.recipients.map(&:id))
      end
    end
  end

  many_to_many :liked_photos,
               resource: PhotoResource

  many_to_many :commented_photos,
               resource: PhotoResource


  filter :sender_id, :integer do
    eq do |scope, value|
      scope.eager_load(:followers).where(:friend_requests => {:sender_id => value})
    end
  end

  filter :recipient_id, :integer do
    eq do |scope, value|
      scope.eager_load(:recipients).where(:friend_requests => {:recipient_id => value})
    end
  end
end
