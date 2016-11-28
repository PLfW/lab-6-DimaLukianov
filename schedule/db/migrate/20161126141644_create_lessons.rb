class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.integer :day
      t.integer :lesson_number
      t.boolean :odd_week
      t.integer :subgroup
      t.integer :lesson_type
      t.string :classroom
      t.references :user, foreign_key: true, index: true
      t.references :subject, foreign_key: true, index: true
      t.references :group, foreign_key: true, index: true

      t.timestamps
    end
  end
end
