class CreateInstructorClasses < ActiveRecord::Migration
  def change
    create_table :instructor_classes do |t|
      t.integer :instructor_id
      t.integer :class_id
    end
  end
end
