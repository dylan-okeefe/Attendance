class RenameCreateattendancesToCreateAttendances < ActiveRecord::Migration
  def change
  	rename_table :attendences, :attendances 
  end
end
