class CreateAttendences < ActiveRecord::Migration
  def change
    create_table :attendences do |t|
      t.integer :class_id
      t.integer :student_id
      t.date :date
      t.time :time

      t.timestamps null: false
    end
  end
end
