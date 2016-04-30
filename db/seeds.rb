# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.new
user1.login = "joe"
user1.email = "joe@cedarville.edu"
user1.password = "password"
user1.password_confirmation = "password"
user1.save!

user2 = User.new
user2.login = "pete"
user2.email = "pete@cedarville.edu"
user2.password = "password"
user2.password_confirmation = "password"
user2.save!

#give joe a couple of plans
Plan.create(user_id: user1.id, name: "Plan1")
Plan.create(user_id: user2.id, name: "Plan2")

u1t1 = Term.new
u1t1.plan_id = (Plan.find_by_name("Plan1")).user_id
u1t1.semester = "spring"
u1t1.year = 2016
u1t1.save!

u1t2 = Term.new
u1t2.plan_id = (Plan.find_by_name("Plan1")).user_id
u1t2.semester = "fall"
u1t2.year = 2015
u1t2.save!

u2t1 = Term.new
u2t1.plan_id = (Plan.find_by_name("Plan2")).user_id
u2t1.semester = "spring"
u2t1.year = 2016
u2t1.save!

u2t2 = Term.new
u2t2.plan_id = (Plan.find_by_name("Plan2")).user_id
u2t2.semester = "fall"
u2t2.year = 2016
u2t2.save!

math = Course.new
math.name = "math"
math.save!

science = Course.new
science.name = "science"
science.save!

english = Course.new
english.name = "english"
english.save!

music = Course.new
music.name = "music"
music.save!

tc1 = TermCourse.new
tc1.course_id = math.id 
tc1.term_id = u1t1.id
tc1.save!

tc2 = TermCourse.new
tc2.course_id = science.id
tc2.term_id = u1t1.id
tc2.save!

