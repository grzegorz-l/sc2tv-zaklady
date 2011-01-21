class User < ActiveRecord::Base
  has_many :bets, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  validates_presence_of :username
  validates_uniqueness_of :username
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  

end
