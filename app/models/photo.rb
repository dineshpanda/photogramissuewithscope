class Photo < ApplicationRecord
  enum status: {"old"=>0, "very_recent"=>1} 

  # Direct associations

  belongs_to :latest_owner,
             :class_name => "User",
             :foreign_key => "owner_id",
             :counter_cache => :latest_photos_count

  belongs_to :owner,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :image, :presence => true

  validates :owner_id, :presence => true

  # Scopes

end
