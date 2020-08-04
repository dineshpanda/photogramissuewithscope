class User < ApplicationRecord
  # Direct associations

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
