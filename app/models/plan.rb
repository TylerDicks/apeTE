class Plan < ActiveRecord::Base
  
  belongs_to(:user) 
  has_many :terms, :dependent => :destroy
  accepts_nested_attributes_for :terms
end
