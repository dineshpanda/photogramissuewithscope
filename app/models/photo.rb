class Photo < ApplicationRecord
  enum status: {"old"=>0, "very_recent"=>1} 

  # Direct associations

  # Indirect associations

  # Validations

  validates :image, :presence => true

  validates :owner_id, :presence => true

  # Scopes

end
