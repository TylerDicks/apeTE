class Plan < ActiveRecord::Base
  belongs_to(:user) 
  #attr_accessible :name
  has_many :terms, :dependent => :destroy
  accepts_nested_attributes_for :terms, :allow_destroy => true
end
