class Album < ActiveRecord::Base
  has_many :photos, :dependent => :destroy
  belongs_to :user
  accepts_nested_attributes_for :photos, :allow_destroy => true
  
  validates_presence_of :name, :description
end
