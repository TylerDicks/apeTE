class Course < ActiveRecord::Base
  has_many :term_courses
 	has_many :terms, through: :term_courses

  accepts_nested_attributes_for :term_courses
end
