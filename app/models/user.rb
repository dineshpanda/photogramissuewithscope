class User < ApplicationRecord
  # Direct associations

  has_many   :latest_photos,
             :class_name => "Photo",
             :foreign_key => "owner_id",
             :dependent => :destroy

  has_many   :accepted_sent_friend_requests,
             -> { accepted },
             :class_name => "FriendRequest",
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :received_friend_requests,
             :class_name => "FriendRequest",
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :sent_friend_requests,
             :class_name => "FriendRequest",
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :comments,
             :foreign_key => "commenter_id",
             :dependent => :destroy

  has_many   :likes,
             :class_name => "Vote",
             :dependent => :destroy

  has_many   :photos,
             :foreign_key => "owner_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :age, :numericality => { :equal_to => 20, :less_than => 22, :other_than => 19, :greater_than => 18, :less_than_or_equal_to => 21, :greater_than_or_equal_to => 20, :odd => true }

  validates :username, :uniqueness => { :scope => [:first_name, :last_name, :age], :allow_blank => true, :case_sensitive => true, :message => "username should be unique always" }

  validates :username, :presence => { :message => "username can not be blank!" }

  validates :username, :length => { :minimum => 5, :maximum => 20, :allow_blank => true }

  validates :username, :inclusion => { :in => [ "Ram", "Lakshmana" ]  }

  # Scopes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
