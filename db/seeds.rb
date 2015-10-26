# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Student.create([{first_name: "omrika", last_name: "folkes"}])
Student.create([{first_name: "sara", last_name: "folkes"}])
Student.create([{first_name: "ika", last_name: "folkes"}])
Student.create([{first_name: "rika", last_name: "folkes"}])

Attendence.create([{class_id: 1, student_id: 1, present: true, late: true}])
Attendence.create([{class_id: 1, student_id: 1, present: false, late: true}])
Attendence.create([{class_id: 1, student_id: 1, present: true, late: false}])
Attendence.create([{class_id: 1, student_id: 1, present: false, late: true}])
