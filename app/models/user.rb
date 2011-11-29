class User < ActiveRecord::Base

  validates_presence_of :first_name, :last_name
  
  has_secure_password

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, :presence => true,
                    :format   => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
                    
  has_many :items, dependent: :destroy
  
end
