class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pets     
  validates :email, presence: true, uniqueness: true, format: { with: 
  /\A[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}\z/i, message: ": Por favor introduzca un email válido"}
end
  
 

