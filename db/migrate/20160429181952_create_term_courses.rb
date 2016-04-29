class CreateTermCourses < ActiveRecord::Migration
  def change
    create_table :term_courses do |t|
      t.references :term, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
