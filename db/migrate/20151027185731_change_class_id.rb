class ChangeClassId < ActiveRecord::Migration
  def change
  	rename_column :attendances, :class_id, :course_id
  end
end
