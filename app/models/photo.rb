class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader

  enum status: {"old"=>0, "very_recent"=>1} 

  # Direct associations

  has_many   :comments,
             :dependent => :destroy

  has_many   :likes,
             :class_name => "Vote",
             :dependent => :destroy

  belongs_to :latest_owner,
             :class_name => "User",
             :foreign_key => "owner_id",
             :counter_cache => :latest_photos_count

  belongs_to :owner,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  has_many   :fans,
             :through => :likes,
             :source => :user

  has_many   :commenters,
             :through => :comments,
             :source => :commenter

  # Validations

  validates :image, :presence => true

  validates :owner_id, :presence => true

  # Scopes

  scope :recent_photos, -> { where(:status => [:old, :very_recent]) }

  scope :good, -> { where("photos.rating >= :query", query: 7.5 ) }

end
