class CreateCourseLocations < ActiveRecord::Migration
  def change
    create_table :course_locations do |t|
      t.integer :course_id
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
