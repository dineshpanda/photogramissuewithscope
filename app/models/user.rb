class User < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :username, :length => { :minimum => 5, :maximum => 20, :allow_blank => true }

  validates :username, :inclusion => { :in => [ "Ram", "Lakshmana" ]  }

  # Scopes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
