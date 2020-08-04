class Comment < ApplicationRecord
  # Direct associations

  belongs_to :photo,
             :counter_cache => true

  belongs_to :commenter,
             :class_name => "User"

  # Indirect associations

  # Validations

  validates :body, :presence => true

  # Scopes

  scope :late_comments, -> { where("comments.schedule_time > :query", query: "2020-08-04 21:30:00 +0530" ).where("comments.schedule_date >= :query", query: "2020-08-01T00:00:00+00:00" ) }

  scope :imp_comments, -> { where(:pin => [true]) }

end
