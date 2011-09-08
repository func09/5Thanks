class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  
  has_many :thanks
  
  validates :username, :uniqueness => { :case_sensitive => false },
                       :length     => { :in => 3..15 }, 
                       :format     => { :with => /^[a-z0-9_]+$/ }
  
  
end
