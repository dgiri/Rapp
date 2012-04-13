class Comment < ActiveRecord::Base
  belongs_to :photo
  validates_presence_of :body
  
  default_scope :order => 'created_at DESC'  
end
