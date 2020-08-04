class PhotoResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :caption, :string
  attribute :image, :string
  attribute :location, :string
  attribute :owner_id, :integer
  attribute :rating, :float
  attribute :status, :integer_enum, allow: Photo.statuses.keys

  # Direct associations

  belongs_to :latest_owner,
             resource: UserResource,
             foreign_key: :owner_id

  belongs_to :owner,
             resource: UserResource

  # Indirect associations

end
