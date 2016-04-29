class Term < ActiveRecord::Base
  belongs_to :plan
  has_many :term_courses
 	has_many :courses, through: :term_courses

end
