class Term < ActiveRecord::Base
  belongs_to :plan
  has_many :term_courses
 	has_many :courses, through: :term_courses
  accepts_nested_attributes_for :term_courses
end
