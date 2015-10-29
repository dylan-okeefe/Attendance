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

Attendance.create([{course_id: 1, student_id: 1, present: true, late: true}])
Attendance.create([{course_id: 1, student_id: 1, present: false, late: true}])
Attendance.create([{course_id: 1, student_id: 1, present: true, late: false}])
Attendance.create([{course_id: 1, student_id: 1, present: false, late: true}])

Course.create([{name: "brooklyn fellowship", latitude: 40.6981454, longitude: -73.9866087}])
Course.create([{name: "manhattan campus", latitude: 40.7053250, longitude: -74.0129460}])
