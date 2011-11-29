class Item < ActiveRecord::Base

  validates_presence_of :name
  
  belongs_to :user
  belongs_to :category
  belongs_to :condition

end
