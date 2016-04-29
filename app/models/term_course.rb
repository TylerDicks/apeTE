class TermCourse < ActiveRecord::Base
  belongs_to :term
  belongs_to :course
end
