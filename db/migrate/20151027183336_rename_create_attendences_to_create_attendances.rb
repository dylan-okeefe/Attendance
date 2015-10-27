class RenameCreateAttendencesToCreateAttendances < ActiveRecord::Migration
  def change
  	rename_table :attendences, :attendances 
  end
end
