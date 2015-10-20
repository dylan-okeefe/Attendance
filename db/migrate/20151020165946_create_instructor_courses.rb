class CreateInstructorCourses < ActiveRecord::Migration
  def change
    create_table :instructor_courses do |t|
      t.integer :instructor_id
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
