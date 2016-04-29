class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.references :plan, index: true, foreign_key: true
      t.string :semester
      t.integer :year

      t.timestamps null: false
    end
  end
end
