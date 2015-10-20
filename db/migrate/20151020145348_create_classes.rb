class CreateClasses < ActiveRecord::Migration
  def change
    create_table :classes do |t|
      t.string :name
    end
  end
end
