class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :student_id
      t.integer :teacher_id
      t.text :text

      t.timestamps null: false
    end
  end
end
