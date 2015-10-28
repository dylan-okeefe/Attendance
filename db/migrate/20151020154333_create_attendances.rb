class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :course_id
      t.integer :student_id
      t.boolean :present
      t.boolean :late

      t.timestamps null: false
    end
  end
end
