class Term < ActiveRecord::Base
  #attr_accessible  :year, :semester
  belongs_to :plan
  has_many :term_courses
 	has_many :courses, through: :term_courses
  accepts_nested_attributes_for :term_courses, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  
end
